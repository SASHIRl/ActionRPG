
function NewTextBox(_message, _background){
	var _obj;
	if instance_exists(oText) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0,0,"Instances",_obj)) {
		message = _message;
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		background = _background;
	}
	
	with(oPlayer) {
		if (state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}