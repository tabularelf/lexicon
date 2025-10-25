// feather ignore all
function LexiconLanguageGet(_lang, _loose = false) {
	return __LexiconGetLocale(_lang, _loose) ?? __LexiconGetLanguage(_lang);
}