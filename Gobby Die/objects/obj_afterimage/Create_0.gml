image_alpha = 1;
lifespan = 15;

var cycle = (current_time div 4) mod 3;

if (cycle == 0) {
    image_blend = c_red;
} else if (cycle == 1) {
    image_blend = c_green;
} else {
    image_blend = c_blue;
}
