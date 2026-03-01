// 1. Play the teleporting sound!
// Priority 10 ensures it isn't cut off by other sounds
audio_play_sound(snd_portal, 10, false);

// 2. Move to the next room
// You can use room_goto_next() or a specific room name
room_goto_next();