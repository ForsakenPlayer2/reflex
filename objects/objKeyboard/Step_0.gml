var players = objControllersParam.players

if keyboard_check_released(vk_enter)
{
	players[$ global.player].playerName = keyboard_string
	room_goto(Room1)
}