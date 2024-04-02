#include "MainInclude.h"
#include <stdarg.h>
#include <string.h>
#include "CrashScreenEnhanced.h"

#define SCREEN_WIDTH 320



u32 crashScreenFont2[7 * 9 + 1] = {
    0x70871c30,0x8988a250,0x88808290,0x88831c90,0x888402f8,0x88882210,0x71cf9c10,0xf9cf9c70,0x8228a288,0xf200a288,0x0bc11c78,0x0a222208,0x8a222288,0x71c21c70,0x23c738f8,0x5228a480,0x8a282280,0x8bc822f0,0xfa282280,0x8a28a480,0x8bc738f8,0xf9c89c08,0x82288808,0x82088808,0xf2ef8808,0x82288888,0x82288888,0x81c89c70,0x8a08a270,0x920da288,0xa20ab288,0xc20aaa88,0xa208a688,0x9208a288,0x8be8a270,0xf1cf1cf8,0x8a28a220,0x8a28a020,0xf22f1c20,0x82aa0220,0x82492220,0x81a89c20,0x8a28a288,0x8a28a288,0x8a289488,0x8a2a8850,0x894a9420,0x894aa220,0x70852220,0xf8011000,0x08020800,0x10840400,0x20040470,0x40840400,0x80020800,0xf8011000,0x70800000,0x88822200,0x08820400,0x108f8800,0x20821000,0x00022200,0x20800020
};

extern u64 osClockRate;

u8 gCrashScreenCharToGlyph[128] = {
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 41, -1, -1, -1, 43, -1, -1, 37, 38, -1, 42,
    -1, 39, 44, -1, 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  36, -1, -1, -1, -1, 40, -1, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
    33, 34, 35, -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
    23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, -1, -1, -1, -1, -1,
};



char *gCauseDesc[18] = {
    "Interrupt",
    "TLB modification",
    "TLB exception on load",
    "TLB exception on store",
    "Address error on load",
    "Address error on store",
    "Bus error on inst.",
    "Bus error on data",
    "System call exception",
    "Breakpoint exception",
    "Reserved instruction",
    "Coprocessor unusable",
    "Arithmetic overflow",
    "Trap exception",
    "Virtual coherency on inst.",
    "Floating point exception",
    "Watchpoint exception",
    "Virtual coherency on data",
};

int gCauseLength[18] = {
    9,
    16,
    21,
    22,
    21,
    22,
    18,
    17,
    21,
    20,
    20,
    20,
    19,
    14,
    26,
    24,
    20,
    25
};

char *gFpcsrDesc[6] = {
    "Unimplemented operation", "Invalid operation", "Division by zero", "Overflow", "Underflow",
    "Inexact operation",
};
void crash_screen_draw_rect(s32 x, s32 y, s32 w, s32 h) {
    u16 *ptr;
    s32 i, j;
    ushort *framebuffer = (ushort*)(g_CfbPtrs[g_DispFrame]);
    ptr = framebuffer + SCREEN_WIDTH * y + x;
    for (i = 0; i < h; i++) {
        for (j = 0; j < w; j++) {
            // 0xe738 = 0b1110011100111000
            *ptr = ((*ptr & 0xe738) >> 2) | 1;
            ptr++;
        }
        ptr += SCREEN_WIDTH - w;
    }
}



void DrawCrashScreenHandler(ushort* Framebuffer, OSThread* Thread)
{
    crash_screen_draw(Thread);
}

void crash_screen_draw_glyph_enhancement(s32 x, s32 y, s32 glyph) {
    const u32 *data;
    u16 *ptr;
    u32 bit;
    u32 rowMask;
    s32 i, j;

    data = &crashScreenFont2[glyph / 5 * 7];
    ushort *framebuffer = (ushort*)(g_CfbPtrs[g_DispFrame]);
    ptr = framebuffer + SCREEN_WIDTH * y + x;

    for (i = 0; i < 7; i++) {
        bit = 0x80000000U >> ((glyph % 5) * 6);
        rowMask = *data++;

        for (j = 0; j < 6; j++) {
            *ptr++ = (bit & rowMask) ? 0xffff : 1;
            bit >>= 1;
        }
        ptr += SCREEN_WIDTH - 6;
    }
}

void PrintStringCrash(int x, int y, char* TextValue, int size) {
    u32 glyph;
    
    
    while (size > 0) {


        glyph = gCrashScreenCharToGlyph[*TextValue & 0x7f];

        if (glyph != 0xff) {
            crash_screen_draw_glyph_enhancement(x, y, glyph);
        }

        size--;

        TextValue++;
        x += 6;
    }
}

void PrintStringUnsigned(int x, int y, char* TextValue, int size,  uint HexValue) {
    u32 glyph;
    

    while (size > 0) {


        glyph = gCrashScreenCharToGlyph[*TextValue & 0x7f];

        if (glyph != 0xff) {
            crash_screen_draw_glyph_enhancement(x, y, glyph);
        }

        size--;

        TextValue++;
        x += 6;
    }

    char* HexArray = (char*)&HexValue;
    int PValue;
    while (size < 4) {

        PValue = ((0xF0 & (int)HexArray[size]) >> 4);

        crash_screen_draw_glyph_enhancement(x, y, PValue);
        

        x += 6;
        
        PValue = ((0x0F & (int)HexArray[size]));

        
        crash_screen_draw_glyph_enhancement(x, y, PValue);

        size++;

        x += 6;
    }
    
}



void crash_screen_draw(OSThread* thread) {
    s16 cause;
    __OSThreadContext *tc = &thread->context;

    cause = (tc->cause >> 2) & 0x1f;
    if (cause == 23) { // EXC_WATCH
        cause = 16;
    }
    if (cause == 31) { // EXC_VCED
        cause = 17;
    }

    osWritebackDCacheAll();

    
    
    
    //crash_screen_draw_rect(15, 15, 291, 100);    
    PrintStringCrash(165, 15, gCauseDesc[cause], gCauseLength[cause]); //lol need int-array of lengths.
    PrintStringUnsigned(45, 15, "ThreadID:", 9,thread->id);

    PrintStringUnsigned(15, 25, "PC:", 3,(u32) tc->pc);
    PrintStringUnsigned(90, 25, "SR:", 3,(u32) tc->sr);
    PrintStringUnsigned(165, 25, "VA:", 3,(u32) tc->badvaddr);
    PrintStringUnsigned(240, 25, "AT:", 3,(u32) tc->at);

    PrintStringUnsigned(15, 36, "V0:", 3,(u32) tc->v0);
    PrintStringUnsigned(90, 36, "V1:", 3,(u32) tc->v1);
    PrintStringUnsigned(165, 36, "A0:", 3,(u32) tc->a0);
    PrintStringUnsigned(240,36, "A1:", 3,(u32) tc->a1);

    PrintStringUnsigned(15,47, "A2:", 3,(u32) tc->a2);
    PrintStringUnsigned(90, 47, "A3:", 3,(u32) tc->a3);
    PrintStringUnsigned(165,47, "T0:", 3,(u32) tc->t0);
    PrintStringUnsigned(240,47, "T1:", 3,(u32) tc->t1);

    PrintStringUnsigned(15, 58, "T2:", 3,(u32) tc->t2);
    PrintStringUnsigned(90,58, "T3:", 3,(u32) tc->t3);
    PrintStringUnsigned(165,58, "T4:", 3,(u32) tc->t4);
    PrintStringUnsigned(240, 58, "T5:", 3,(u32) tc->t5);

    PrintStringUnsigned(15,69, "T6:", 3,(u32) tc->t6);
    PrintStringUnsigned(90,69, "T7:", 3,(u32) tc->t7);
    PrintStringUnsigned(165, 69, "T8:", 3,(u32) tc->t8);
    PrintStringUnsigned(240,69, "T9:", 3,(u32) tc->t9);

    PrintStringUnsigned(15,80, "S0:", 3,(u32) tc->s0);
    PrintStringUnsigned(90, 80, "S1:", 3,(u32) tc->s1);
    PrintStringUnsigned(165,80, "S2:", 3,(u32) tc->s2);
    PrintStringUnsigned(240,80, "S3:", 3,(u32) tc->s3);

    PrintStringUnsigned(15, 91, "S4:", 3,(u32) tc->s4);
    PrintStringUnsigned(90,91, "S5:", 3,(u32) tc->s5);
    PrintStringUnsigned(165,91, "S6:", 3,(u32) tc->s6);
    PrintStringUnsigned(240, 91, "S7:", 3,(u32) tc->s7);

    PrintStringUnsigned(15,102, "S8:", 3,(u32) tc->s8);
    PrintStringUnsigned(90,102, "SP:", 3,(u32) tc->sp);
    PrintStringUnsigned(165,102, "GP:", 3,(u32) tc->gp);
    PrintStringUnsigned(240,102, "RA:", 3,(u32) tc->ra);
    /*

    lol you figure out how to print floats
    crash_screen_print_fpcsr(tc->fpcsr);
    crash_screen_print_float_reg(30, 170, 0, &tc->fp0.f.f_even);
    crash_screen_print_float_reg(120, 170, 2, &tc->fp2.f.f_even);
    crash_screen_print_float_reg(210, 170, 4, &tc->fp4.f.f_even);
    crash_screen_print_float_reg(30, 180, 6, &tc->fp6.f.f_even);
    crash_screen_print_float_reg(120, 180, 8, &tc->fp8.f.f_even);
    crash_screen_print_float_reg(210, 180, 10, &tc->fp10.f.f_even);
    crash_screen_print_float_reg(30, 190, 12, &tc->fp12.f.f_even);
    crash_screen_print_float_reg(120, 190, 14, &tc->fp14.f.f_even);
    crash_screen_print_float_reg(210, 190, 16, &tc->fp16.f.f_even);
    crash_screen_print_float_reg(30, 200, 18, &tc->fp18.f.f_even);
    crash_screen_print_float_reg(120, 200, 20, &tc->fp20.f.f_even);
    crash_screen_print_float_reg(210, 200, 22, &tc->fp22.f.f_even);
    crash_screen_print_float_reg(30, 210, 24, &tc->fp24.f.f_even);
    crash_screen_print_float_reg(120, 210, 26, &tc->fp26.f.f_even);
    crash_screen_print_float_reg(210, 210, 28, &tc->fp28.f.f_even);
    crash_screen_print_float_reg(30, 220, 30, &tc->fp30.f.f_even);
    */

    
    ushort *framebuffer = (ushort*)(g_CfbPtrs[g_DispFrame]);
   
	*sourceAddress = (int)(&Crash);
	*targetAddress = (int)(g_CfbPtrs[g_DispFrame]);
    *targetAddress +=  + (0x1E780);
	dataLength = (int)&CrashEnd - (int)&Crash;
	runDMA();
    
    osViBlack(FALSE);
    osViSwapBuffer(framebuffer);
}