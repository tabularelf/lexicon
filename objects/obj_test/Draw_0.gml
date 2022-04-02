/// @description Draw event

if (keyboard_check_released(vk_space)) {
	language_index = ++language_index mod array_length(languages_array);
	
	if (array_length(languages_array) == 0) {
		lexicon_locale_set("en-A");
	} else {
		lexicon_locale_set(languages_array[language_index][1]);	
	}
}

draw_set_font(fn_fontWithJapanese);
draw_text(32,32,"Normal Version: " + lexicon_text_array("text.test",array));
draw_text(32,64,"Struct Version: " + lexicon_text_struct("text.test2",struct));
draw_text(32, 96, string(lexicon_entries_get_unicode_range()));
draw_set_font(font);
draw_text(32, 128, [string(lexicon_text_get_unicode_range("Orospu pıtış")), "Orospu pıtış"]);
draw_text(32,160,languages_array);
draw_text(32,192,lexicon_locale_get());

draw_text(room_width div 2, room_height div 2, "Press spacebar to cycle languages");