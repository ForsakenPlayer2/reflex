var players = objLeaderboard.scores
var playersNames = struct_get_names(players)
array_sort(playersNames, true)

objLeaderboard.endRound = true;

colors = [c_red, c_blue, c_yellow, c_green, c_orange, c_aqua, c_fuchsia,c_purple]

objLeaderboard.poses = {}

for(var i = 0; i < array_length(playersNames); i++)
{
	var player = playersNames[i];
	
	objLeaderboard.scores[$ player].guessed = false;
	
	var pos_x = room_width/(array_length(playersNames)+1)
	
	struct_set(objLeaderboard.poses, playersNames[i], {x: pos_x * (i + 1), y: objMicro.y+64, chosenBy: 0, currentlyOn: 0})
	instance_create_layer(pos_x + (objLeaderboard.poses[$ playersNames[0]].currentlyOn * 8), objMicro.y+176, "Instances", objPlayer, {color: colors[i], pos: 0, player: playersNames[i], index: i})
	objLeaderboard.poses[$ playersNames[0]].currentlyOn += 1;
}