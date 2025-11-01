// feather ignore all
/// @param {String} language_or_locale
/// @param {Bool} async
function LexiconLanguageSet(_lang, _async = false) {
	static _global = __LexiconSystem();
	if (!_async && !LexiconPlugInsAreLoaded()) {
		LexiconPlugInForceLoad();
	}
	
	var _foundLang = is_string(_lang) ? LexiconLanguageGet(_lang) : _lang;
	if (!LexiconIsLanguage(_foundLang)) {
		__LexiconTrace($"Language \"{_lang}\" not found.");
		return;
	}

	if (_global.__mainLanguage == _foundLang) {
		return;
	}

	__LexiconUpdateLanguage(_foundLang, _async);
}