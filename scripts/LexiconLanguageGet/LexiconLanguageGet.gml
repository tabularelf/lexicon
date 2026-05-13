// feather ignore all
/// @param {String} language_or_locale Language to fetch
/// @param {Bool} loose Whether locale search should be loose or not. i.e. "en_AU" will loosely look for "en" if it cannot find "en_AU".
function LexiconLanguageGet(_lang, _loose = false) {
	if (LexiconIsLanguage(_lang)) return _lang;
	if (is_struct(_lang)) && (!LexiconIsLanguage(_lang)) return undefined;
	if (is_undefined(_lang)) return undefined;

	if (__LEXICON_AUTO_TRIM_LANGUAGE_LOCALE) && (string_trim(_lang) != _lang) {
		__LexiconTrace($"Warning: \"{string_trim(_lang)}\" is not properly trimmed. Make sure that you are trimming your inputs!");
		var _callstack = debug_get_callstack();
		var _str = "  " + string_join_ext("\n  ", _callstack, 1, array_length(_callstack)-12);
		__LexiconTrace($"Callstack:\n{_str}");
	}
	return __LexiconGetLocale(string_trim(_lang), _loose) ?? __LexiconGetLanguage(string_trim(_lang));
}