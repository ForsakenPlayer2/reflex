var players = objControllersParam.players
var playersNames = struct_get_names(players)
array_sort(playersNames, true)

for(var i = 0; i < array_length(playersNames); i++)
{
	var player = players[$ playersNames[i]]
	var inputsRef = player.inputsRef
	var playerInputs = player.playerInputs
	
	var guid = gamepad_get_guid(player.controllerId)
	
	if guid == "030000004c0500006802000000000000"
	{
		gamepad_test_mapping(player.controllerId, "030000004c0500006802000000000000,PS3 Controller,platform:Windows,a:b14,b:b13,x:b15,y:b12,leftshoulder:b10,rightshoulder:b11,lefttrigger:b8,righttrigger:b9,start:b3,back:b0,dpup:b4,dpdown:b6,dpleft:b7,dpright:b5,")
	}
}

room_goto(Room1)