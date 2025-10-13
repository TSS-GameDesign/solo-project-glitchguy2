// Gravity
vsp += grv;

var h_steps = abs(hsp);
var h_dir = sign(hsp);

for (var i = 0; i < h_steps; i++) {
    if (!instance_place(x + h_dir, y, obj_conveyor)) {
        x += h_dir;
    } else {
        hsp = 0;
        break;
    }
}

var v_steps = abs(vsp);
var v_dir = sign(vsp);

for (var i = 0; i < v_steps; i++) {
    if (!instance_place(x, y + v_dir, obj_conveyor)) {
        y += v_dir;
    } else {
        vsp = 0;
        break;
    }
}