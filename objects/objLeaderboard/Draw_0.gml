draw_self()
colors = [c_red, c_blue, c_yellow, c_green, c_orange, c_aqua, c_fuchsia, c_purple]

var scoresPlayers = struct_get_names(scores)
var scoresLength = array_length(scoresPlayers)
array_sort(scoresPlayers, true)

for(var i = 0; i < scoresLength; i++)
{
	var player = scoresPlayers[i]
	var circle_radius = 4
	
	draw_set_halign(fa_left);
	
	var text = string(players[$ player].playerName) + " " + string(scores[$ player].score)
	var text_w = string_width("text")
	var text_h = string_height("text")
	var text_x = x + 32
	var text_y = y + 16*i
	
	draw_set_colour(colors[i])
	draw_circle(text_x - 16, text_y + text_h/2, circle_radius, false)
	draw_set_colour(c_white)
	
	if traitorRevealed and player == objMicro.traitor draw_set_colour(c_red)
	if showWinner and player == winner draw_set_colour(c_yellow)
	else if !traitorRevealed
	{
		if scores[$ player].guessed draw_set_colour(c_grey)
		else draw_set_colour(c_white)
	}
	
	draw_text(text_x, text_y, text)
}

if revealVotes
{
	for(var i = 0; i < revealVotesAmount; i++)
	{
		var player = scores[$ scoresPlayers[i]]
		var playerVotedFor = player.votedFor
		var votedForIndex = scores[$ scoresPlayers[i]].votedForIndex
		
		var text = string(players[$ playerVotedFor].playerName) + " " + string(scores[$ playerVotedFor].score)
		var text_w = string_width("text")
		var text_h = string_height("text")
		var text_x = x + 32
		var text_y = y + 16 * array_get_index(scoresPlayers, playerVotedFor)
		
		draw_set_colour(colors[i])
		draw_circle(text_x + text_w + 16 + (votedForIndex*8), text_y + text_h/2 , 4, false)
		draw_set_colour(c_white)
	}
}

if endRound and !endGame
{
	var pos_x = room_width/(scoresLength+1)
	
	for(var i = 0; i < scoresLength; i++)
	{
		var player = scoresPlayers[i]
		
		draw_set_halign(fa_center);	
		draw_set_colour(c_white)
		draw_text(pos_x * (i + 1) , objMicro.y+128, string(players[$ player].playerName))
	}
}