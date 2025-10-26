// feather ignore all
function LexiconLanguageIsLoaded(_lang = LexiconLanguageGetCurrent()) {
	static _global = __LexiconSystem();
	if (is_string(_lang)) {
		_lang = LexiconLanguageGet(_lang);
	}

	if (__LexiconLanguageIsDummy(_lang)) {
		return false;
	}

	if (is_undefined(_lang)) {
		__LexiconError($"Invalid language was passed in.\nGot \"{_lang}\"!");
		return;
	}

	return ((_global.__languageLoaded && (_lang == _global.__mainLanguage)) || (_lang.__loaded));
}