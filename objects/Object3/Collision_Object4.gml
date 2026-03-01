// --- DAMAGE AND INVINCIBILITY ---

// 1. Check if the player is allowed to take damage right now
if (can_take_damage == true)
{
    // Lose exactly 1 chunk of the health bar
    my_health -= 1;          
    
    // Turn ON our invincibility shield so we don't take more damage instantly
    can_take_damage = false; 
    
    // Set Alarm 0 to count down from 60 frames (1 full second of safety)
    alarm[0] = 60;           
}

// --- DEATH CHECK ---

// 2. Did we run out of health chunks?
if (my_health <= 0)
{
    // If we have 0 lives left, restart the level!
    room_restart();
}