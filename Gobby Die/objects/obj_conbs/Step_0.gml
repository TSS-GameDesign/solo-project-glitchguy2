// Reset horizontal speed
hsp = 0;


// Environment checks
var on_ground = place_meeting(x, y + 1, obj_solid);
var wall_left = place_meeting(x - 1, y, obj_solid);
var wall_right = place_meeting(x + 1, y, obj_solid);

// Jumping
if (keyboard_check_pressed(ord("W"))) {
    if (on_ground) {
        vsp = jumpspeed;
    }
}    
// Input movement
if (keyboard_check(ord("D"))) {
    hsp = movespeed;
    facing = 1;
}
if (keyboard_check(ord("A"))) {
    hsp = -movespeed;
    facing = -1;
}

// Gravity
vsp += grv;

var h_steps = abs(hsp);
var h_dir = sign(hsp);

for (var i = 0; i < h_steps; i++) {
    if (!instance_place(x + h_dir, y, obj_solid) && !instance_place(x + h_dir, y, obj_startbarrier)) {
        x += h_dir;
    } else {
        hsp = 0;
        break;
    }
}

var v_steps = abs(vsp);
var v_dir = sign(vsp);

for (var i = 0; i < v_steps; i++) {
    if (!instance_place(x, y + v_dir, obj_solid) && !instance_place(x, y + v_dir, obj_startbarrier)) {
        y += v_dir;
    } else {
        vsp = 0;
        break;
    }
}




// Trampoline haha
if (place_meeting(x, y + vsp, obj_trampoline)) {
    while (!place_meeting(x, y + sign(vsp), obj_trampoline)) {
        y += sign(vsp);
    }
    
    // Go up
    vsp = -9; // bounce strength
}

// Check if touching boost pad
if (place_meeting(x, y, obj_boost)) {
    movespeed = boost_speed;
    alarm[0] = room_speed * 2; // reset in 2 seconds
}

