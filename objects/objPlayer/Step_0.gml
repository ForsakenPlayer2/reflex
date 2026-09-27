var poses = objLeaderboard.poses
var posesNames = struct_get_names(poses)
array_sort(posesNames, true)

var currentlyOn = poses[$ posesNames[pos]].currentlyOn - 1
var pos_x = room_width/(array_length(posesNames)+1)

var pos_index = 0

var playerList = []

if currentlyOn > 0
{
	var inst = self
	
	with objPlayer
	{
		if pos == inst.pos
		{
			array_push(playerList, self)
		}
	}
	
	for(var i = 0; i <= currentlyOn; i++)
	{
		if index > playerList[i].index and playerList[i].choseTraitor == false
		{
			pos_index += 1;
		}
	}
}



x = pos_x * (pos + 1) + (pos_index * 8)

var players = objLeaderboard.players
var playerInputs = players[$ player].playerInputs
var inputsRef = players[$ player].inputsRef

if playerInputs[$ inputsRef.leftButton].released and pos > 0 and !choseTraitor
{
	poses[$ posesNames[pos]].currentlyOn -= 1;
	pos -= 1;
	poses[$ posesNames[pos]].currentlyOn += 1;
}

if playerInputs[$ inputsRef.rightButton].released and pos < array_length(posesNames) - 1 and !choseTraitor
{
	poses[$ posesNames[pos]].currentlyOn -= 1;
	pos += 1;
	poses[$ posesNames[pos]].currentlyOn += 1;
}

if playerInputs[$ inputsRef.aButton].released and !choseTraitor
{
	var playerChosen = posesNames[pos]
	objLeaderboard.scores[$ player].votedFor = playerChosen
	
	choseTraitor = true;;
	objLeaderboard.poses[$ playerChosen].chosenBy += 1;
}

if playerInputs[$ inputsRef.bButton].released and choseTraitor
{
	var playerChosen = posesNames[pos]
	objLeaderboard.scores[$ player].votedFor = {}
	
	choseTraitor = false;
	objLeaderboard.poses[$ playerChosen].chosenBy -= 1;
}