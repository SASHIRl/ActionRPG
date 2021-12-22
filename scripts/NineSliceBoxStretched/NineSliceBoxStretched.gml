//NineSliceBox (sprite, x1, y1, x2, y2);
//@arg sprite //Sprite usado para criar as caixas de texto
//@arg x1 //Posição esquerda da caixa de texto
//@arg y1 //Posição topo da caixa de texto
//@arg x2 //Posição direita da caixa de texto
//@arg y2 //Posição baixo da caixa de texto

// ' _ ' nas variáveis serve como uma convenção para indicar que as váriaveis
// estão relacionadas a apenas esse Script

function NineSliceBoxStretched(sprite, x1, y1, x2, y2, _index){
	var _size = sprite_get_width(sprite) / 3;
	var _x1 = x1;
	var _y1 = y1;
	var _x2 = x2;
	var _y2 = y2;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	var _columns = _w div _size;
	var _rows = _h div _size;
	
//O código abaixo vai pegar o sprite que está dividido em 9 partes e repetir ele
//para criar a caixa de texto

//Cantos
	//Topo esquerda
	draw_sprite_part(sprite, 0, 0, 0, _size, _size, _x1, _y1);
	//Topo direita
	draw_sprite_part(sprite, 0, _size * 2, 0, _size, _size, _x1+(_columns * _size), _y1);
	//Baixo esquerda
	draw_sprite_part(sprite, 0, 0, _size * 2, _size, _size, _x1, _y1+(_rows * _size));
	//Baixo direita
	draw_sprite_part(sprite, 0, _size * 2, _size * 2, _size, _size, _x1 + (_columns * _size), _y1 + (_rows * _size)); 

//Lados
	for (var i = 1; i < (_rows); i++) {
		//Lado esquerdo
		draw_sprite_part(sprite, 0, 0, _size, _size, _size, _x1, _y1+(i*_size));
		//Lado direito
		draw_sprite_part(sprite, 0, _size * 2, _size, _size, _size, _x1+(_columns * _size), _y1+(i * _size));
	}
	
	for (var i = 1; i < (_columns); i++) {
		//Lado cima
		draw_sprite_part(sprite, 0, _size, 0, _size, _size, _x1+(i*_size), _y1);
		//Lado baixo
		draw_sprite_part(sprite, 0, _size, _size * 2, _size, _size, _x1+(i * _size), _y1+(_rows * _size));
	}

//Meio
	for(var i = 1; i < (_columns); i++) {
		for (var j = 1; j < (_rows); j++) {
			draw_sprite_part(sprite, 0, _size, _size, _size, _size, _x1 + (i*_size), _y1 + (j * _size));	
		}
	}
}