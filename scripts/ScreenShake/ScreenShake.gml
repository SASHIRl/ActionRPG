//ScreenShake(magnitude, frames)
// Magnitude sets the strenght of the shake (distance range)
// Frames sets the lenght of the shake in frames ( 60 = 1 second)

function ScreenShake(magnitude, frames){
	with (global.iCamera) {
		if (magnitude> shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}