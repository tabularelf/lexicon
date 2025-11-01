if (keyboard_check_released(vk_space)) {
	langIndex = (langIndex + 1) % array_length(languages);
	LexiconLanguageSet(languages[langIndex]);
}

if (keyboard_check_released(ord("Q"))) {
	playerData.money++;
}

