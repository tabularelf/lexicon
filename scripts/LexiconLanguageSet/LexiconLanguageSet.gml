// feather ignore all
function LexiconLanguageSet(_lang, _async = false) {
	static _global = __LexiconSystem();
	if (!_async && !LexiconPlugInsAreLoaded()) {
		LexiconPlugInForceLoad();
	}
	
	var _foundLang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	if (is_undefined(_foundLang)) {
		__LexiconTrace($"Language \"{_lang}\" not found.");
		return;
	}

	if (_global.__mainLanguage == _foundLang) {
		return;
	}

	__LexiconUpdateLanguage(_foundLang, _async);
}