//handle background music

//check to see if any music is playing
if (!mute){
	audio_resume_all()
	var pick_new_music = true
	for (var i = 0; i < number_of_BGM_tracks; i++){
		if (audio_is_playing(background_music[i])){
			pick_new_music = false
		}
	}
	if (pick_new_music = true){
		randomize()
		var random_seed = irandom(number_of_BGM_tracks-1)
		audio_play_sound(background_music[random_seed], 0, false)
	}
}
if (mute){
	audio_pause_all()
}
