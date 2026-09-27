if roundNb < 9
{
	var players = objLeaderboard.players
	var playersNames = struct_get_names(players)
	var playerAmount = array_length(playersNames)

	guess = false;

	for(var i = 0; i < playerAmount; i++)
	{
		var player = playersNames[i];
		objLeaderboard.scores[$ player].guessed = false;
	}

	roundNb += 1

	guess_speed = choose(guessSpeeds.VERYSLOW, guessSpeeds.SLOW, guessSpeeds.DEFAULT, guessSpeeds.FAST, guessSpeeds.VERYFAST, guessSpeeds.ENDGAME)

	guessButton = "aButton"

	image_speed = objMicro.speeds[guess_speed]

	alarm[1] = game_get_speed(gamespeed_fps) * (image_number/image_speed)
}
else instance_destroy(self)