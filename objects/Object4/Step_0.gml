// 1. Apply gravity so the slime stays on the floor
vsp = vsp + grv;

// 2. Horizontal Collision & Turning Around!
if (place_meeting(x + hsp, y, tilemap))
{
    while (!place_meeting(x + sign(hsp), y, tilemap))
    {
        x = x + sign(hsp);
    }
    // THE MAGIC TRICK: If you hit a wall, reverse direction!
    hsp = -hsp; 
}
x = x + hsp;

// 3. Vertical Collision (Don't fall through the floor)
if (place_meeting(x, y + vsp, tilemap))
{
    while (!place_meeting(x, y + sign(vsp), tilemap))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// 4. Flip the sprite to face the direction it's walking
// (Using 'abs' keeps whatever custom size you stretched it to in the room!)
if (hsp != 0) 
{
    image_xscale = sign(hsp) * abs(image_xscale);
}