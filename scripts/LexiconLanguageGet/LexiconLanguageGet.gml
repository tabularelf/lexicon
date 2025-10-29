// feather ignore all
function LexiconLanguageGet(_lang, _loose = false) {
	if (LexiconIsLanguage(_lang)) return _lang;
	return __LexiconGetLocale(_lang, _loose) ?? __LexiconGetLanguage(_lang);
}