var players = objControllersParam.players;
var playersNames = struct_get_names(players);

for(var i = 0; i < array_length(playersNames); i++)
{
	var player = players[$ playersNames[i]]
	var playerInputs = player.playerInputs
	var inputsRef = player.inputsRef
	
	if detectGuessInput(playerInputs, inputsRef, objControllersParam.button_sprite_pos)
	{
	
		if guess and !objLeaderboard.scores[$ playersNames[i]].guessed
		{
			if playerInputs[$ inputsRef[$ guessButton]].pressed
			{
				if !objLeaderboard.scores[$ playersNames[i]].guessed
				{
					objLeaderboard.scores[$ playersNames[i]].score += playersPoints[0];
					objLeaderboard.scores[$ playersNames[i]].guessed = true;
			
					if array_length(playersPoints) > 1
					{
						array_delete(playersPoints, 0, 1)
					}
				}
			}
			
			else 
			{
				objLeaderboard.scores[$ playersNames[i]].guessed = true;
			}
		}
	}
}