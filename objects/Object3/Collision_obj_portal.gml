// 1. Play the magical portal sound!
if (!audio_is_playing(snd_portal)) 
{
    audio_play_sound(snd_portal, 10, false);
}

// 2. Zap the player to the transition room immediately
room_goto(Room3);