spawn_timer += 1;


if (spawn_timer >= spawn_interval) {
    spawn_timer = 0
    // Spawn a laser at this spawner's position
    instance_create_layer(x, y, "Instances", obj_dtrampoline);
}
