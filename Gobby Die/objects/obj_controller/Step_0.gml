if (keyboard_check(ord("M"))) {
    hold_time += 1;
} else {
    hold_time = 0;
}

if (hold_time >= room_speed * 3) { // 3 seconds
    room_goto(rm_start); // Replace with your start room name
}
