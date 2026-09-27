var playersInfo = struct_get_names(players)
var controllerAmount = array_length(playersInfo)

for(var i = 0; i < controllerAmount; i++)
{
	var player = players[$ playersInfo[i]]
	if player.controllerId == -1
	{
		if keyboard_lastkey != vk_nokey
		{
			var keyboardButtons = []
			var keyboardInputs = variable_struct_get_names(player.inputsRef);
			for (var k = 0; k < array_length(keyboardInputs); k++)
			{
				keyboardButtons[k] = struct_get(player.inputsRef, keyboardInputs[k])
			}
			
			for (var b = 0; b < array_length(keyboardButtons); b++)
			{
				var btn = keyboardButtons[b];
		
				var input = {
				    pressed  : keyboard_check_pressed(btn),
				    released : keyboard_check_released(btn),
				    held     : keyboard_check(btn)
				};

				struct_set(player.playerInputs, string(btn), input);

			}
		}
	}
	
	else if player.controllerId >= 0
	{
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
}