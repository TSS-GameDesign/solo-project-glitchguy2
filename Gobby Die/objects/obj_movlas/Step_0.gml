// --- PLAYER COLLISION ---
var hit = instance_place(x, y, obj_platbs);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_platps);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_plater);
if (hit != noone) with(hit) instance_destroy();
    
hit = instance_place(x, y, obj_coner);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_conps);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_conbs);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_dbox);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_dboost);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_dtrampoline);
if (hit != noone) with(hit) instance_destroy();
