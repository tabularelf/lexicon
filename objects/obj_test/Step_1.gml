if (keyboard_check_released(ord("Z"))) && string_length(keyboard_string) > 0 {
	keyboard_string = string_copy(keyboard_string, 1, string_length(keyboard_string)-1);
}