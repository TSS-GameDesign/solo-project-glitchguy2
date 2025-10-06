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

// Trampoline haha
if (place_meeting(x, y + vsp, obj_trampoline)) {
    // Move the object down until just touching the trampoline
    while (!place_meeting(x, y + sign(vsp), obj_trampoline)) {
        y += sign(vsp);
    }
    
    // Go up
    vsp = -9; // bounce strength
}

// Check if touching boost pad
if (place_meeting(x, y, obj_boost)) {
    movespeed = boost_speed;
    alarm[0] = room_speed * 2; // reset in 3 seconds
}
