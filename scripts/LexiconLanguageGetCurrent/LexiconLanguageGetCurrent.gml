// feather ignore all
/// @return {Struct.__LexiconLanguageClass}
function LexiconLanguageGetCurrent() {
	static _global = __LexiconSystem();
	return _global.__mainLanguage ?? __LexiconLanguageDummy();
}