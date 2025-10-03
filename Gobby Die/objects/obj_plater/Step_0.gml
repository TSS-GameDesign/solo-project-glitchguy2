// Reset horizontal speed
hsp = 0;

// Environment checks
var on_ground = place_meeting(x, y + 1, obj_solid);
var wall_left = place_meeting(x - 1, y, obj_solid);
var wall_right = place_meeting(x + 1, y, obj_solid);

// Jumping
if (keyboard_check_pressed(ord("I"))) {
    if (on_ground) {
        vsp = jumpspeed;
    }
}    
// Input movement
if (keyboard_check(ord("L"))) {
    hsp = movespeed;
    facing = 1;
}
if (keyboard_check(ord("J"))) {
    hsp = -movespeed;
    facing = -1;
}

// Gravity
vsp += grv;

// Horizontal movement & collision
if (!place_meeting(x + hsp, y, obj_solid)) {
    x += hsp;
} else {
    while (!place_meeting(x + sign(hsp), y, obj_solid)) {
        x += sign(hsp);
    }
    hsp = 0;
}

// Vertical movement & collision
if (!place_meeting(x, y + vsp, obj_solid)) {
    y += vsp;
} else {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
    vsp = 0;
}
