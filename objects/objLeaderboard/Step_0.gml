
if instance_exists(objPlayer)
{
	endGame = true;
	
	with objPlayer
	{
		if choseTraitor = false 
		{
			objLeaderboard.endGame = false
			break
		}
	}
}

if endGame and alarm[0] < 0 and !traitorRevealed and alarm[1] < 0
{
	if instance_exists(objPlayer) with objPlayer instance_destroy(self)
	
	if !revealVotes
	{
		alarm[0] = game_get_speed(gamespeed_fps) * 3
	}
	else alarm[0] = (game_get_speed(gamespeed_fps) * 2)/revealSpeed
}

if traitorFound and decrease and scores[$ objMicro.traitor].score > 0
{
	scores[$ objMicro.traitor].score -= 1
}