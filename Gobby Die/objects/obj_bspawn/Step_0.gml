spawn_timer += spawny;


if (spawn_timer >= spawn_interval) {
    spawn_timer = 0;
    
    // Pick a random object to spawn
    var choice = irandom_range(0, 10);
    var obj_to_spawn;

    switch (choice) {
        case 0: obj_to_spawn = obj_dbox; break;
        case 1: obj_to_spawn = obj_dtrampoline; break;
        case 2: obj_to_spawn = obj_dbox; break;
        case 3: obj_to_spawn = obj_dbox; break;
        case 4: obj_to_spawn = obj_dbox; break;
        case 5: obj_to_spawn = obj_dboost; break;
        case 6: obj_to_spawn = obj_dbox; break;
        case 7: obj_to_spawn = obj_dbox; break;
        case 8: obj_to_spawn = obj_dboost; break;
        case 9: obj_to_spawn = obj_dbox; break;
        case 10: obj_to_spawn = obj_dtrampoline; break;
    }

    // Spawn chosen object
    instance_create_layer(x, y, "Instances", obj_to_spawn);
}