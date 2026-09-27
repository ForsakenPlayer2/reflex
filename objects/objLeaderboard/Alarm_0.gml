revealVotes = true;

var playersNames = struct_get_names(scores)
array_sort(playersNames, true)


for(var i = 0; i < array_length(playersNames); i++)
{
	var player = playersNames[i];
	
	var playerVotedFor = scores[$ player].votedFor
	
	if poses[$ playerVotedFor].chosenBy > 1
	{	
		var sameVotedFor = [];
		
		for(var j = 0; j < array_length(playersNames); j++)
		{
			var otherPlayer = playersNames[j];
			
			if scores[$ otherPlayer].votedFor == scores[$ player].votedFor
			{
				array_push(sameVotedFor, otherPlayer);
			}
		}
		
		scores[$ player].votedForIndex = array_get_index(sameVotedFor, player);
	}
}


if revealVotesAmount < array_length(playersNames)
{	
	revealVotesAmount += 1;
	revealSpeed *= 2
}
else 
{
	alarm[1] = game_get_speed(gamespeed_fps) * 3
}