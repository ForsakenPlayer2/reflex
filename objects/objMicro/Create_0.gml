var roomInfo = room_get_info(room)

room_w = roomInfo.width
room_h = roomInfo.height

x = room_w/2
y = room_h/2

enum guessSpeeds
{
	VERYSLOW,
	SLOW,
	DEFAULT,
	FAST,
	VERYFAST,
	ENDGAME
}
speeds = [0.5, 0.75, 1, 1.25, 1.5, 2]

traitor = noone
gameStarted = false