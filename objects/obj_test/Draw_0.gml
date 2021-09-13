/// @description Draw event

if (keyboard_check_released(vk_space)) {
	language_index = ++language_index mod array_length(languages_array);
	
	if (language_index == 0) {
		lexicon_locale_set("en-A");
	} else {
		lexicon_locale_set(languages_array[language_index][1]);	
	}
}

draw_text(32,32,"Normal Version: " + lexicon_text_array("text.test",array));
draw_text(32,64,"Struct Version: " + lexicon_text_struct("text.test2",struct));

draw_text(32,96,languages_array);
draw_text(32,128,lexicon_locale_get());

draw_text(room_width div 2, room_height div 2, "Press spacebar to cycle languages");