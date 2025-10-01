lifespan -= 1;
image_alpha -= 1 / 15;

if (lifespan <= 0) {
    instance_destroy();
}
