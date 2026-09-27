randomise()

var players = objControllersParam.players
var playerNames = struct_get_names(players)

if array_length(playerNames) > 1
{	
	for(var i = 0; i < array_length(playerNames); i++)
	{
		var player = players[$ playerNames[i]]
		var playerInputs = player.playerInputs
		var inputsRef = player.inputsRef
		
		if detectInput(playerInputs)
		{
			if playerInputs[$ inputsRef.startButton].pressed and !gameStarted
			{
				traitor = "p2"
				instance_create_layer(x + sprite_width/2 , y, "Instances", objInputSpeedCheck)
				instance_create_layer(0 , 0, "Instances", objLeaderboard)
				gameStarted = true
			}		
		 
			if playerInputs[$ inputsRef.selectButton].released and !gameStarted
			{
				global.player = playerNames[i]
				room_goto(roomNameChoose);
			}
			
			if traitor != noone
			{
				var traitorInputs = players[$ traitor].playerInputs
				var traitorInputsRef = players[$ traitor].inputsRef
				
				if traitorInputs[$ traitorInputsRef.downButton].released and alarm[0] < 0
				{
					gamepad_set_vibration(players[$ traitor].controllerId, 0.05, 0.05)
					alarm[0] = game_get_speed(gamespeed_fps)*0.1
				}
				
				if detectInput(traitorInputs)
				{
					if instance_exists(objInputSpeedCheck)
					{
						if !objInputSpeedCheck.guess
						{
							var buttonList = struct_get_names(objControllersParam.button_sprite_pos)
							for(var j = 0; j < array_length(buttonList); j++)
							{
								if traitorInputs[$ traitorInputsRef[$ buttonList[j]]].released
								{
									objInputSpeedCheck.guessButton = buttonList[j]
								}
							}
						}
					}
				}
			}
		}
	
		if keyboard_check_pressed(vk_space) and !gameStarted
		{
			room_goto(roomRemap);
		}
	}
}