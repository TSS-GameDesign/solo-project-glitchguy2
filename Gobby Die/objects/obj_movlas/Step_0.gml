// --- PLAYER COLLISION ---
var hit = instance_place(x, y, obj_platbs);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_platps);
if (hit != noone) with(hit) instance_destroy();

hit = instance_place(x, y, obj_plater);
if (hit != noone) with(hit) instance_destroy();
