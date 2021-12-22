// Set up Camera
cam = view_camera[0]; // Camera ID
follow = oPlayer;
//Uma opção seria dividir por 2, porém, é uma boa pratica utilizar multiplicação quando você sabe o resultado que precisa, pois, a ULA utiliza mais tempo de processamento realizando divisões.
viewWidthHalf = camera_get_view_width(cam) * 0.5; //Valor da altura e largura para posicionar a camera no centro.
viewHeightHalf = camera_get_view_height(cam) * 0.5;
//As váriaveis abaixo servem para determinar para onde a câmera vai.
xTo = xstart;
yTo = ystart;

//Camera shake

shakeLength = 0; //Quanto tempo a câmera vai tremer
shakeMagnitude = 0; //A força que a câmera vai tremer
shakeRemain = 0; //Quanto falta para a câmera terminar de tremer