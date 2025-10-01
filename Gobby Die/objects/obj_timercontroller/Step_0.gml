// Count time for each player if they're "It"
if (instance_exists(obj_player) && obj_player.is_it) {
    blue_time += 1;
}
if (instance_exists(obj_player2) && obj_player2.is_it) {
    pink_time += 1;
}
if (instance_exists(obj_player3) && obj_player3.is_it) {
    red_time += 1;
}

// Count down the global game timer
if (global_timer > 0) {
    global_timer -= 1;
}
if (global_timer <= 0) {
    global_timer = 0;

    if (instance_exists(obj_player))  obj_player.is_it = false;
    if (instance_exists(obj_player2)) obj_player2.is_it = false;
    if (instance_exists(obj_player3)) obj_player3.is_it = false;
}
if (global_timer <= 0 && !show_results) {
    global_timer = 0;
    show_results = true;

    if (instance_exists(obj_player))  obj_player.is_it = false;
    if (instance_exists(obj_player2)) obj_player2.is_it = false;
    if (instance_exists(obj_player3)) obj_player3.is_it = false;
}

if (show_results && fade_alpha > 0) {
    fade_alpha -= 0.01;
}
