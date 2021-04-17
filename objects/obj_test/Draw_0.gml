/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_released(vk_space)) {
	lexicon_set_language(lexicon_get_language() == "English" ? "French" : "English");
}

//var _text = lexicon_text("text.test",5, _date);
draw_text(32,32,lexicon_text_struct("text.test2",struct));


//34334,34343,34343,34343,343434,5,45,4,54,4,54,54,));
draw_text(32,64,lexicon_get_languages());
draw_text(32,96,lexicon_get_locale());