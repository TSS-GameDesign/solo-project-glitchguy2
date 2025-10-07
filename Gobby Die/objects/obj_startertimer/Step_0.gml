if (timer > 0) {
    timer -= 1;
} else {
    with (obj_startbarrier) {
        instance_destroy();
    }
}
