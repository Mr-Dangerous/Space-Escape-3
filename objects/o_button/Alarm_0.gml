/// @description Insert description here
// You can write your code in this editor
switch(button_function){
	case 0:
	button_text = "Resolutions"
	break;
	case 1:
	button_text = "firing_range"
	break;
	case 2:  
	button_text = "1920 x 1080"
	break;
	case 3:
	button_text = "1600 x 900"
	break;
	case 4:
	button_text = "1280 x 768"
	break;
	case 5:
	var _full_screen = _ui_spawner.full_screen
	if (_full_screen){
		button_text = "Windowed"
	} else {
		button_text = "Full Screen"
	}
	break;
	case 6:
	button_text = "Main Menu"
	break;
}