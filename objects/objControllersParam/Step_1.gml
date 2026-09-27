var playersInfo = struct_get_names(players)
var controllerAmount = array_length(playersInfo)

for(var i = 0; i < controllerAmount; i++)
{
	var player = players[$ playersInfo[i]];
	
	player.playerInputs = {};
		
	var gamepadButtons = [];
	var gamepadInputs = variable_struct_get_names(player.inputsRef);
	for (var k = 0; k < array_length(gamepadInputs); k++)
	{
		gamepadButtons[k] = struct_get(player.inputsRef, gamepadInputs[k])
	}
	for (var b = 0; b < array_length(gamepadButtons); b++)
	{
		var btn = gamepadButtons[b];
			
		var input = {
			pressed  : gamepad_button_check_pressed(player.controllerId, btn),
			released : gamepad_button_check_released(player.controllerId, btn),
			held     : gamepad_button_check(player.controllerId, btn)
		};
			
		struct_set(player.playerInputs, string(btn), input);
	}
}