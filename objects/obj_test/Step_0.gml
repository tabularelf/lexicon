/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_released(vk_space)) {
	language_index = ++language_index % array_length(languages_array);
	lexicon_locale_set(languages_array[language_index][1]);	
}