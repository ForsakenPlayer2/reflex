draw_self()

if guess
{
	var guessButton_sprite_w = 64
	var guessButton_sprite_h = 64
	var guessButton_posx = objControllersParam.button_sprite_pos[$ guessButton].sprite_posx
	var guessButton_posy = objControllersParam.button_sprite_pos[$ guessButton].sprite_posy
	draw_sprite_part(xbox_series_sheet_default, 1, guessButton_sprite_w * guessButton_posx, guessButton_sprite_h * guessButton_posy, objControllersParam.sprite_size_w, objControllersParam.sprite_size_h, x-32, y-32)
}