traitorRevealed = true;

var playersNames = struct_get_names(players)
array_sort(playersNames, true)

var playerVotedAmount = 0
var player = noone
for(var i = 0; i < array_length(playersNames); i++)
{
	if poses[$ playersNames[i]].chosenBy > playerVotedAmount
	{
		player = playersNames[i]
		playerVotedAmount = poses[$ playersNames[i]].chosenBy
	}
}

if player == objMicro.traitor traitorFound = true;
alarm[2] = game_get_speed(gamespeed_fps) * 3