// 1. Play the shiny coin sound!
audio_play_sound(snd_coin, 1, false);

// 2. Add to your score
my_score += 10;

// 3. Destroy the coin so it vanishes
with (other) 
{
    instance_destroy();
}