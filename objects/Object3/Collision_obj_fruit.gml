// 1. Play the eating sound!
audio_play_sound(snd_fruit, 1, false);

// 2. Heal the player by 1 chunk
// We use clamp to make sure health never goes above your max_health (7)
my_health = clamp(my_health + 1, 0, max_health); 

// 3. Destroy the fruit so it's "eaten"
with (other) 
{
    instance_destroy();
}