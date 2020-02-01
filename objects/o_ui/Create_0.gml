persistent = true
background_music[0] = sound_darkling
background_music[1] = sound_epic_unease
background_music[2] = sound_industrial_cinematic

number_of_BGM_tracks = array_length_1d(background_music)

#region fonts
map_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,;:?!-_~#\"'&()[]|\/@°+=&$£€<>% "
f_font_white = font_add_sprite_ext(s_font_white, map_string, true, 2)
f_font_black = font_add_sprite_ext(s_font_black, map_string, true, 2)
#endregion
