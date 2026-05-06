// feather ignore all
/// @param {String} language_or_locale Language to fetch
/// @param {Bool} loose Whether locale search should be loose or not. i.e. "en_AU" will loosely look for "en" if it cannot find "en_AU".
function LexiconLanguageGet(_lang, _loose = false) {
	if (LexiconIsLanguage(_lang)) return _lang;
	return __LexiconGetLocale(string_trim(_lang), _loose) ?? __LexiconGetLanguage(string_trim(_lang));
}