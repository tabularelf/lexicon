/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_released(vk_space)) {
	++language_index;
	language_index = language_index mod array_length(languages_array);
	
	lexicon_set_locale(languages_array[language_index][1]); //"English" ? "French" : "English");
}

draw_set_font(font)
draw_text(32,32,"Normal Version: " + lexicon_text("text.test",100, "TabularElf", string( date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))));
draw_text(32,64,"Struct Version: " + lexicon_text_struct("text.test2",struct));

draw_text(32,96,languages_array);
draw_text(32,128,lexicon_get_locale());