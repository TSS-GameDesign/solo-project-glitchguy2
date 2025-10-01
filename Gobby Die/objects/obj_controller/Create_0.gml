hold_time = 0;
// Get all players
var p1 = instance_find(obj_player, 0);
var p2 = instance_find(obj_player2, 0);
var p3 = instance_find(obj_player3, 0);

// Pick a random number 1 to 3
var pick = irandom_range(1, 3);

// Reset everyone
p1.is_it = false;
p2.is_it = false;
p3.is_it = false;

// Assign "It" randomly
if (pick == 1) {
    p1.is_it = true;
} else if (pick == 2) {
    p2.is_it = true;
} else if (pick == 3) {
    p3.is_it = true;
}
