/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_released(vk_space)) {
	lexicon_set_language(lexicon_get_language() == "English" ? "French" : "English");
}

repeat(10) draw_text(32,32,lexicon_text("text.test",date_time_string(date_current_datetime()),12312,5223423,current_time));//lexicon_text_array("text.test",array));
draw_text(32,64,lexicon_get_languages());
draw_text(32,96,lexicon_get_locale());