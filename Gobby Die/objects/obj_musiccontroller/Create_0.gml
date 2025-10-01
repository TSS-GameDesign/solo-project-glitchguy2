persistent = true;

last_room = room;

if (room == rm_start || room == rm_levelselect) {
    var pick = choose(mus_start3, mus_start4, mus_start2, mus_start1);
    audio_play_sound(pick, 1, true);
} else {
    var pick = choose(mus_map4, mus_map2, mus_map4, mus_map2);
    audio_play_sound(pick, 1, true);
}
