// Spawn rate in frames
spawn_rate = 120; // every 2 seconds
timer = 0;

timer += 1;

// Time to spawn a new object
if (timer >= spawn_rate) {
    timer = 0;

    // Randomly choose which object to spawn
    if (irandom(1) == 0) {
        instance_create_layer(x, y, "Instances", obj_dboost);
    } else {
        instance_create_layer(x, y, "Instances", obj_dtrampoline);
    }
}
