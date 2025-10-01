// Default: don't show unless someone is tagged
visible = false;

// Show above Player 1 (Blue) if they are it
if (instance_exists(obj_player) && obj_player.is_it) {
    sprite_index = spr_bSquareITtag;
    x = obj_player.x - 5;
    y = obj_player.y - 80;
    visible = true;
}

// Show above Player 2 (Pink) if they are it
else if (instance_exists(obj_player2) && obj_player2.is_it) {
    sprite_index = spr_pSquareITtag;
    x = obj_player2.x - 5;
    y = obj_player2.y - 80;
    visible = true;
}

// Show above Player 3 (Red) if they are it
else if (instance_exists(obj_player3) && obj_player3.is_it) {
    sprite_index = spr_eRedITtag;
    x = obj_player3.x - 5;
    y = obj_player3.y - 80;
    visible = true;
}