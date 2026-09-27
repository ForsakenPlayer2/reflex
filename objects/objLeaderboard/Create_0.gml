players = objControllersParam.players

scores = 
{
}

var playerNames = struct_get_names(players)
array_sort(playerNames, true)

for(var i = 0; i < array_length(playerNames); i++)
{
	var player = playerNames[i]
	var playerName = players[$ player].playerName
	struct_set(scores, player, {"guessed": false, "score": 0, votedFor: {}, votedForIndex: 0})
}