// Conveyor speed
conspeed = spawny; // Negative = left, positive = right
diff_timer += 1;

// Loop over all instances
with (all) {
    // Skip objects we don't want to move, including this conveyor
    if (id != other.id && object_index != obj_startbarrier && object_index != obj_solid && object_index != obj_conveyor) {
        // Check if this instance is standing on the conveyor
        if (place_meeting(x, y + 1, other)) {
            // Move the instance along the conveyor
            x += other.conspeed;
        }
    }
}

if (diff_timer >= diff_inter) {
    diff_timer = 0;
    spawny  -= 1;
}