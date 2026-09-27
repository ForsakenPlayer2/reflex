var playersInfo = struct_get_names(players)
var controllerAmount = array_length(playersInfo)
array_sort(playersInfo, true)

if !instance_exists(objLeaderboard) and room_get_name(room) ==  "Room1"
{
	for(var i = 0; i < controllerAmount; i++)
	{
		var player = playersInfo[i]
		draw_set_halign(fa_left);
		draw_set_colour(c_white)
		draw_text(x, y + 16*i, string(players[$ player].playerName))
	}
}

//for(var i = 0; i < controllerAmount; i++)
//{
//	var player = players[$ playersInfo[i]]
	
//	draw_set_color(c_white);
//    draw_text(20 + i*450, 20, string(playersInfo[i]) + " ID: " + string(player.controllerId));
	
//    var yy = 40;
//    var keys = variable_struct_get_names(player.playerInputs);
//    if array_length(keys) > 0
//	{
//		for (var k = 0; k < array_length(keys); k++)
//	    {
//	        var key = keys[k];
//	        var val = variable_struct_get(player.playerInputs, key);
//	        draw_text(20 + i*450, yy, string(key) + ": " + string(val));
//	        yy += 20;
//	    }
//	}
//}