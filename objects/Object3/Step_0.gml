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

if (can_take_damage == false)
{
    sprite_index = spr_player_hit;
    if (hsp != 0) image_xscale = sign(hsp); 
}
else 
{
    if (hsp != 0) 
    {
        sprite_index = spr_player_run; 
        image_xscale = sign(hsp);      
    }
    else 
    {
        sprite_index = Sprite5;        
    }
}

// --- FALLING DEATH CHECK ---
if (y > room_height)
{
    // Play the death sound right before restarting!
    audio_play_sound(snd_death, 10, false);
    room_restart();
}

// --- MINING SYSTEM (FIXED RHYTHM) ---

if (keyboard_check(ord("E")))
{
    var target_x = x + (sign(image_xscale) * 20);
    var target_y = y; 
    
    var tile = tilemap_get_at_pixel(tilemap, target_x, target_y);
    
    if (tile > 0)
    {
        // This is the repeating sound!
        // It plays at frame 0, 20, 40, 60, 80, 100
        if (mining_timer % 20 == 0)
        {
            audio_play_sound(snd_mine, 1, false);
        }

        mining_timer += 1;
        
        // Break the block after 2 seconds (120 frames)
        if (mining_timer >= 120)
        {
            tilemap_set_at_pixel(tilemap, 0, target_x, target_y);
            mining_timer = 0; 
        }
    }
    else
    {
        mining_timer = 0;
    }
}
else
{
    mining_timer = 0;
}