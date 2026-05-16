// feather ignore all
/// @param {String} language_or_locale
/// @param {Bool} async
function LexiconLanguageSet(_lang, _async = false) {
	static _global = __LexiconSystem();
	if (!_async && !LexiconPlugInsAreLoaded()) {
		LexiconPlugInForceLoad();
	}
	
	var _foundLang = is_string(_lang) ? LexiconLanguageGet(string_trim(_lang)) : _lang;
	if (!LexiconIsLanguage(_foundLang)) {
		__LexiconTrace($"Language \"{_lang}\" not found.");
		return;
	}

	if (__LEXICON_AUTO_TRIM_LANGUAGE_LOCALE) && (is_string(_lang) && (string_trim(_lang) != _lang)) {
		__LexiconTrace($"Warning: \"{string_trim(_lang)}\" is not properly trimmed. Make sure that you are trimming your inputs!");
		var _callstack = debug_get_callstack();
		var _str = "  " + string_join_ext("\n  ", _callstack, 1, array_length(_callstack)-2);
		__LexiconTrace($"Callstack:\n{_str}");
	}

	if (_global.__mainLanguage == _foundLang) {
		return;
	}

	__LexiconUpdateLanguage(_foundLang, _async);
}