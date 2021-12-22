//Pause the Game

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		with (all) {
			gamePausedImageSpeed = image_speed; //Guarda o movimento que algo esta sendo feito no momento que pausar
			image_speed = 0;
			
		}
	}
	else {
		with (all) {
			image_speed = gamePausedImageSpeed;
		}
	}
}