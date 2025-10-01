// If the cooldown is active, decrement the timer
if (active) {
    cooldown_timer -= 1;
    
    // If cooldown is complete, reset the cooldown
    if (cooldown_timer <= 0) {
        active = false;
    }
}
