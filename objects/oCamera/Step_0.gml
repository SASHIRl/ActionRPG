//Update Camera



//Update Destination
if (instance_exists(follow)) { //Move X e Y para as coordenadas abaixo
	
	xTo = follow.x;
	yTo = follow.y;
	
}

//Update Object Position

x += (xTo - x) / 15; //Diferença entre onde estamos indo (xTo) e onde estamos (x)
y += (yTo - y) / 15;

//Keep Camera center inside room

x = clamp(x, viewWidthHalf, room_width-viewWidthHalf); //Função Clamp escolhe um valor minimo e máximo e persiste um resultado entre esses valores.
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

//Screen Shake

x += random_range(-shakeRemain, shakeRemain); //Pega dois números e escolhe um valor entre eles.
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) *  shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);








