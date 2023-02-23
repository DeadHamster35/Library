#ifndef HootItembox
#define HootItembox

#include "../MainInclude.h" 


extern float ib_blender_scale;

extern u64 ibhatena_gem_txt;

extern Vtx ibshadow_Gem_mesh_vtx_0;
extern Vtx ibhatena_Gem_mesh_vtx_0;
extern Vtx ib_Gem_mesh_vtx_0;

extern Gfx ibshadow_Gem_mesh_tri_0;
extern Gfx ibhatena_Gem_mesh_tri_0;
extern Gfx ib_Gem_mesh_tri_0;

extern Gfx ib_Gem_mesh;
extern Gfx ibhatena_Gem_material;
extern Gfx ibhatena_Gem_mesh;
extern Gfx ibshadow_Gem_mesh;

extern void set_object_buffer_hook (Object *obj,FVector pos,SVector angle,FVector velo,short category);
extern void move_itembox_hook(Object *obj);
extern void move_fake_itembox_hook (Object *obj);
extern void move_special_itembox_hook(Object *obj);
extern void change_ib_crash_col (); //USE OG TRIS FOR CRASH ANIM (THIS WILL CHANGE THE MENU CURSOR TOO!)
extern void display_fake_itembox_hack (Camera *camera,Object *obj);
extern void display_itembox_hack (Camera *camera,Object *obj);


#endif
