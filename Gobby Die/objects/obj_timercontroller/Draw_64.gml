draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(-1); // Default font

// Draw timers (fade out)
draw_set_alpha(fade_alpha);

draw_set_color(c_white);
draw_text(32, 32, "Blue (It time): " + string(floor(blue_time / room_speed)) + "s");
draw_text(32, 64, "Pink (It time): " + string(floor(pink_time / room_speed)) + "s");
draw_text(32, 96, "Red (It time): " + string(floor(red_time / room_speed)) + "s");
// Countdown timer turns red when finished
if (global_timer <= 0) {
    draw_set_color(c_red);
} else {
    draw_set_color(c_white);
}

var seconds_left = floor(global_timer / room_speed);
var minutes = seconds_left div 60;
var seconds = seconds_left mod 60;
var timer_text = string(minutes) + ":" + string_format(seconds, 2, 0);
draw_text(32, 140, "Time Left: " + timer_text);

// Reset alpha
draw_set_alpha(1);

// Show results once fade-out is done
if (show_results && fade_alpha <= 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    var blue = floor(blue_time / room_speed);
    var pink = floor(pink_time / room_speed);
    var red  = floor(red_time / room_speed);

    // Create a new array for player scores
    var player_scores = [
        ["Blue", blue],
        ["Pink", pink],
        ["Red",  red]
    ];

    // Manual bubble sort (lowest to highest)
    for (var i = 0; i < 4; i++) {
        for (var j = i + 1; j < 4; j++) {
            if (player_scores[i][1] > player_scores[j][1]) {
                var temp = player_scores[i];
                player_scores[i] = player_scores[j];
                player_scores[j] = temp;
            }
        }
    }

    var center_x = display_get_gui_width() / 2;
    var starting_y = 100;  // Set starting point for 'y' above results display

    // Use a different variable name for Y positioning to avoid conflicts
    var y_pos = starting_y;

    // Draw results
    for (var i = 0; i < 4; i++) {
        var name = player_scores[i][0];
        var time = player_scores[i][1];
        var text = name + ": " + string(time) + "s";

        if (i == 0) {
            // Winner — larger text (simply making it bold or larger size without 'font_big')
            draw_set_font(-1); // Use default font
            draw_set_color(c_yellow); // Change color to highlight the winner
            draw_text(center_x, y_pos, text);
            y_pos += 48;  // Increase space after the winner
        } else {
            draw_set_font(-1);  // Default font
            draw_set_color(c_white); // Default color
            draw_text(center_x, y_pos, text);
            y_pos += 32;  // Space between results
        }
    }
}
