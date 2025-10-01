// Reset horizontal speed
hsp = 0;

// Update movement stats based on "It" status
if (is_it) {
    movespeed = 4.5;
    jumpspeed = -10;
    grv = 0.3;
	dash_cooldown_max = 50;
} else {
    movespeed = 4;
    jumpspeed = -8;
    grv = 0.25;
	dash_cooldown_max = 70;
}

// Input movement
var axis = gamepad_axis_value(0, gp_axislh); // Left stick horizontal axis (player 1)

// Deadzone check to avoid drift
if (abs(axis) > 0.2) {
    hsp = axis * movespeed;
    facing = sign(axis);
} else {
    hsp = 0;
}


// Apply dash boost if dashing
if (is_dashing) {
    hsp += dash_speed * facing;
}

// Wall jump cooldown
if (wall_jump_cooldown > 0) {
    wall_jump_cooldown -= 1;
}

// Environment checks
var on_ground = place_meeting(x, y + 1, obj_solid);
var wall_left = place_meeting(x - 1, y, obj_solid);
var wall_right = place_meeting(x + 1, y, obj_solid);

// Jumping + wall jumping
if (gamepad_button_check_pressed(0, gp_face2)) { // B on Xbox, Circle on PS
    if (on_ground) {
        vsp = jumpspeed;
    } else if (wall_left && wall_jump_cooldown <= 0) {
        vsp = jumpspeed;
        hsp = movespeed;
        wall_jump_cooldown = 40;
    } else if (wall_right && wall_jump_cooldown <= 0) {
        vsp = jumpspeed;
        hsp = -movespeed;
        wall_jump_cooldown = 40;
    }
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

// Tagging
var cooldown_object = instance_find(obj_tagcooldown, 0);
if (cooldown_object != undefined && !cooldown_object.active) {
    if (is_it && distance_to_object(obj_player2) < 5) {
        is_it = false;
        obj_player2.is_it = true;
        cooldown_object.active = true;
        cooldown_object.cooldown_timer = cooldown_object.cooldown_duration;
        timer = max(timer - 3, 0);
    }
    if (is_it && distance_to_object(obj_player3) < 5) {
        is_it = false;
        obj_player3.is_it = true;
        cooldown_object.active = true;
        cooldown_object.cooldown_timer = cooldown_object.cooldown_duration;
        timer = max(timer - 3, 0);
    }
	if (is_it && distance_to_object(obj_player) < 5) {
        is_it = false;
        obj_player.is_it = true;
        cooldown_object.active = true;
        cooldown_object.cooldown_timer = cooldown_object.cooldown_duration;
        timer = max(timer - 3, 0);
    }
}

// Sprite switching
if (is_it) {
    sprite_index = spr_gobbyIT;
} else {
    sprite_index = spr_gobbyRun;
}

// Return to menu by holding M
if (keyboard_check(ord("M"))) {
    hold_time += 1;
    if (hold_time >= room_speed * 5) {
        room_goto(rm_menu);
    }
} else {
    hold_time = 0;
}

// Afterimage when "It"
if (is_it && current_time mod 4 == 0) {
    var a = instance_create_layer(x, y, layer, obj_afterimage);
    a.sprite_index = sprite_index;
    a.image_index = image_index;
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
    a.image_blend = image_blend;
}

// Dash input
if (!is_dashing && dash_cooldown <= 0 && gamepad_button_check_pressed(0, gp_shoulderr)) {
    is_dashing = true;
    dash_timer = dash_duration;
    dash_cooldown = dash_cooldown_max;
}

// Dash timer logic
if (is_dashing) {
    dash_timer -= 1;
    if (dash_timer <= 0) {
        is_dashing = false;
    }
} else {
    if (dash_cooldown > 0) {
        dash_cooldown -= 1;
    }
}
