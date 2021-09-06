/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_released(vk_space)) {
	language_index = ++language_index mod array_length(languages_array);
	
	lexicon_locale_set(languages_array[language_index][1]);
}

draw_set_font(font)

draw_text(32,32,"Normal Version: " + lexicon_text_array("text.test",array));
draw_text(32,64,"Struct Version: " + lexicon_text_struct("text.test2",struct));


draw_text(32,96,languages_array);
draw_text(32,128,lexicon_locale_get());