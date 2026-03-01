// 1. Move horizontally and bounce off walls!
if (place_meeting(x + hsp, y, tilemap))
{
    hsp = -hsp; // Reverse direction when it hits a dirt block!
}
x = x + hsp;

// 2. If the player is standing on it, carry them along!
if (place_meeting(x, y - 1, Object3))
{
    Object3.x += hsp;
}