image_index = 0;
image_speed = 0;

alarm[0] = game_get_speed(gamespeed_fps) * 2

guess = true;
var players = objLeaderboard.players
var playerAmount = array_length(struct_get_names(players))

switch playerAmount
{
	case 2: playersPoints = [3, 1];
		break;
	case 3: playersPoints = [5, 3, 1];
		break;
	default: playersPoints = [5, 3, 2, 1];
		break;
}