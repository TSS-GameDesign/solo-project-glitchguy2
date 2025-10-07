if (timer > 0) {
    var seconds = timer / room_speed;
    
    var ts = instance_find(obj_timerspawn, 0);
    if (ts != noone) {
        var x_pos = ts.x;
        var y_pos = ts.y - 20; // 20 pixels above timerspawn
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        
        draw_text(x_pos, y_pos - 20, "Release in:");
        
        draw_text(x_pos, y_pos, string_format(seconds, 0, 2));
    }
}
