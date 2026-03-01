// Get the camera's position and size
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

// Create the glass surface if it doesn't exist
if (!surface_exists(darkness_surface)) {
    darkness_surface = surface_create(cam_w, cam_h);
}

// 1. Tell GameMaker to paint on our glass instead of the screen
surface_set_target(darkness_surface);

// 2. Paint it black! (0.9 is the opacity. 1.0 is totally pitch black)
draw_clear_alpha(c_black, 0.9);

// 3. Turn on the "Eraser" mode
gpu_set_blendmode(bm_subtract);

// 4. Punch a hole exactly where the player (Object3) is standing!
if (instance_exists(Object3)) {
    // We do Player.x - cam_x to match the screen perfectly
    var player_x_on_screen = Object3.x - cam_x;
    var player_y_on_screen = Object3.y - cam_y;
    
    draw_circle(player_x_on_screen, player_y_on_screen, light_size, false);
}

// 5. Turn off the eraser and stop painting on the glass
gpu_set_blendmode(bm_normal);
surface_reset_target();

// 6. Draw our finished shadow overlay into the actual game!
draw_surface(darkness_surface, cam_x, cam_y);