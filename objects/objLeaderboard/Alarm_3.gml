var playersNames = struct_get_names(players)
array_sort(playersNames, true)

var player = playersNames[0]
for(var i = 0; i < array_length(playersNames); i++)
{
	if scores[$ playersNames[i]].score > scores[$ player].score
	{
		player = playersNames[i]
	}
}

winner = player;
showWinner = true;

alarm[4] =  game_get_speed(gamespeed_fps) * 5