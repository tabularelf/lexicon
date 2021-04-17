/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_released(vk_space)) {
	lexicon_set_language(select_relative_wrap(lexicon_get_language(),1,"English","French","Japanese")) //"English" ? "French" : "English");
}

draw_set_font(font)

draw_text(32,32,lexicon_text("text.test",100, "TabularElf", string( date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))));
draw_text(32,64,lexicon_get_languages());
draw_text(32,96,lexicon_get_locale());
