/// @desc get_input()

// Movement keys
//right_Key = 2*max(keyboard_check_released(vk_right), 0);
//left_Key = 2*max(keyboard_check_released(vk_left), 0);
//down_Key = 2*max(keyboard_check_released(vk_down), 0);
//up_Key = 2*max(keyboard_check_released(vk_up), 0);

//// A, S, D keys
//a_Key = 2*max(keyboard_check_released(ord("A")), 0);
//s_Key = 2*max(keyboard_check_released(ord("S")), 0);
//d_Key = 2*max(keyboard_check_released(ord("D")), 0);

// Movement keys
right_Key = max(keyboard_check(vk_right), keyboard_check(vk_numpad6), 0);
left_Key = max(keyboard_check(vk_left), keyboard_check(vk_numpad4), 0);
down_Key = max(keyboard_check(vk_down), keyboard_check(vk_numpad5), 0);
up_Key = max(keyboard_check(vk_up), keyboard_check(vk_numpad8), 0);

// A, S, D keys
a_Key = max(keyboard_check(ord("A")), 0);
s_Key = max(keyboard_check(ord("S")), 0);
d_Key = max(keyboard_check(ord("D")), 0);

if (gamepad_is_connected(0)){

	right_Key = gamepad_button_check(0, gp_padr);	
	left_Key = gamepad_button_check(0, gp_padl);	
	down_Key = gamepad_button_check(0, gp_padd);	
	up_Key = gamepad_button_check(0, gp_padu);
	
}


ret = [right_Key, left_Key, down_Key, up_Key, a_Key, s_Key, d_Key] ;

//entry_flag = 0;
//alarm[1] = 5;

return ret
