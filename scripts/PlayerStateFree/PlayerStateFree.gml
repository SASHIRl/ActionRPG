function PlayerStateFree(){
	/*Movimento, funções LENGTHDIR_X LENGTHDIR_Y para definir a distancia e direção
	do personagem... A função retorna o X e Y de um vetor */
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index (Afirma qual sprite esta sendo usado no momento)
	//var = váriavel temporaria no gamemaker
	/*Dependendo do que estiver sendo feito no jogo, sera decedido qual sprite
	o jogo ira utilizar, como por exemplo um personagem andando em direção a uma
	parede...*/
	var _oldSprite = sprite_index; //Serve para lembrar qual Sprite estava sendo utilizado.

	if (inputMagnitude != 0) {
		direction = inputDirection
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0; /* serve para resetar a animação.
	Por exemplo, se o personagem começa a andar e para, e começa a andar novamente, esse procedimento
	vai resetar o frame do movimento */

	//Updating Image Index
	PlayerAnimateSprite();

	
	//Activate key logic
		if(keyActivate) {
			//1. Check for an entity to activate
			var _activateX = lengthdir_x(10, direction);
			var _activateY = lengthdir_y(10, direction);
			activate = instance_position(x+ _activateX, y + _activateY, pEntity);

			//2. If there is nothing, or there is something, but it  has no script -Roll!
			if (activate == noone || activate.entityActivateScript == -1) {
				state = PlayerStateRoll;	
				moveDistanceRemaining = distanceRoll;	
			} else { 
			//3. Otherwise, there is something and it has a script! Activate!
				ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			//4. If the thing we activate is an NPC, make it face towards us!
				if (activate.entityNPC) {
					with(activate) {
						direction = point_direction(x, y, other.x, other.y);
						image_index = CARDINAL_DIR
					}
				}
			}
		}
	}