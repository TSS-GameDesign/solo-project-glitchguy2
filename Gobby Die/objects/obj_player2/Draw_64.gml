// Convert world to GUI coordinates
var screen_x = camera_get_view_x(view_camera[0]);
var screen_y = camera_get_view_y(view_camera[0]);

var gui_x = x - screen_x + 15; // 15 Pixels (Attempt to Center)
var gui_y = y - screen_y - 20; // 40 pixels above player

var bar_width = 40;
var bar_height = 6;

// Background bar
draw_set_color(c_black);
draw_rectangle(gui_x - bar_width/2, gui_y, gui_x + bar_width/2, gui_y + bar_height, false);

// Fill bar
if (dash_cooldown > 0) {
    var fill = 1 - (dash_cooldown / dash_cooldown_max); // Fill up
    draw_set_color(c_red);
    draw_rectangle(gui_x - bar_width/2, gui_y, gui_x - bar_width/2 + bar_width * fill, gui_y + bar_height, false);
} else {
    draw_set_color(c_lime); // Fully charged
    draw_rectangle(gui_x - bar_width/2, gui_y, gui_x + bar_width/2, gui_y + bar_height, false);
}
