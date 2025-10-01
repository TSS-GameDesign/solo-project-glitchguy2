if (room != last_room) {
    // The music only changes when you change from start to map
    var was_menu = (last_room == rm_start || last_room == rm_levelselect);
    var now_menu = (room == rm_start || room == rm_levelselect);

    if (was_menu != now_menu) {
        audio_stop_all();

        if (now_menu) {
            var pick = choose(mus_start3, mus_start1, mus_start4, mus_start2);
            audio_play_sound(pick, 1, true);
        } else {
            var pick = choose(mus_map4, mus_map2, mus_map2, mus_map4);
            audio_play_sound(pick, 1, true);
        }
    }

    last_room = room;
}
