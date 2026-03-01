var tilemap = layer_tilemap_get_id("Tiles_1");
// 1. Get keyboard input (Strictly A and D for movement, W or Space for jump)
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);

// 2. Calculate movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv; // Apply gravity

// 3. Jump (Height cut in half! Now works on platforms too)
if ((place_meeting(x, y + 1, tilemap) || place_meeting(x, y + 1, obj_platform)) && (key_jump))
{
    vsp = -4.5; 
}

// 4. Horizontal Collision (Tiles AND Platforms)
if (place_meeting(x + hsp, y, tilemap) || place_meeting(x + hsp, y, obj_platform))
{
    while (!place_meeting(x + sign(hsp), y, tilemap) && !place_meeting(x + sign(hsp), y, obj_platform))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// 5. Vertical Collision (Tiles AND Platforms)
if (place_meeting(x, y + vsp, tilemap) || place_meeting(x, y + vsp, obj_platform))
{
    while (!place_meeting(x, y + sign(vsp), tilemap) && !place_meeting(x, y + sign(vsp), obj_platform))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// --- ANIMATION SYSTEM ---

// 1. Are we currently invincible/hurt?
if (can_take_damage == false)
{
    // Force the red flashing HIT animation!
    sprite_index = spr_player_hit;
    
    // Keep facing the correct direction while flashing
    if (hsp != 0) image_xscale = sign(hsp); 
}
else 
{
    // 2. Normal, healthy animations!
    if (hsp != 0) 
    {
        sprite_index = spr_player_run; // Switch to the running animation
        image_xscale = sign(hsp);      // Flip left/right
    }
    else 
    {
        sprite_index = Sprite5;        // Switch back to your idle frame
    }
}
if (y > room_height)
{
    room_restart();
}
// --- MINING SYSTEM ---
// Notice we changed "check_pressed" to just "check" so it works while HOLDING!
if (keyboard_check(ord("E")))
{
    var target_x = x + (sign(image_xscale) * 20);
    var target_y = y; 
    
    // Check what is in front of us
    var tile = tilemap_get_at_pixel(tilemap, target_x, target_y);
    
    // If we are hitting a dirt block...
    if (tile > 0)
    {
        // Increase the timer!
        mining_timer += 1;
        
        // If we held it for 2 seconds (120 frames)
        if (mining_timer >= 120)
        {
            // BREAK IT! Set that pixel to 0 (air)
            tilemap_set_at_pixel(tilemap, 0, target_x, target_y);
            
            // Reset the timer so we can start mining the next block
            mining_timer = 0; 
        }
    }
    else
    {
        // If we are holding E but pointing at empty air, reset the timer
        mining_timer = 0;
    }
}
else
{
    // If we let go of the E key, reset the timer completely
    mining_timer = 0;
}