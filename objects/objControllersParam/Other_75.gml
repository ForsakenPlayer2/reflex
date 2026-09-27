if (async_load[? "event_type"] == "gamepad discovered")
{
    var _pad = async_load[? "pad_index"];
    gamepad_set_axis_deadzone(_pad, 0.2);
	
	var playersInfo = struct_get_names(players);
	var controllerAmount = array_length(playersInfo);
	
	var disconnect = false;
	var playerDisconnected = undefined;
	
	for(var i = 0; i < controllerAmount; i++)
	{
		var player = players[$ "p" + string(i+1)];
		
		if player.controllerId == undefined
		{
			disconnect = true;
			playerDisconnected = players[$ "p" + string(i+1)];
			break;
		}
	}
	
	switch disconnect
	{
		case true: 
			playerDisconnected.controllerId = _pad;
			playerDisconnected.controllerType = "gamepad";
			playerDisconnected.inputsRef = inputs.gamepad;
			break;
		case false:
			players[$ "p" + string(controllerAmount+1)] = new playerInfo(_pad, "gamepad", inputs.gamepad, "p" + string(controllerAmount+1));
			players[$ "p" + string(controllerAmount+1)].object = undefined
			break;
	}

}

else if (async_load[? "event_type"] == "gamepad lost")
{
    var _pad = async_load[? "pad_index"];
	
	var playersInfo = struct_get_names(players);
	var controllerAmount = array_length(playersInfo);
	
	for(var i = 0; i < controllerAmount; i ++)
	{
		var player = players[$ "p" + string(i+1)];
		
		if player.controllerId == _pad
		{
			player.controllerId = undefined;
			player.playerInputs = {};
			player.controllerType = undefined;
			player.inputsRef = {};
			break;
		}
	}
}