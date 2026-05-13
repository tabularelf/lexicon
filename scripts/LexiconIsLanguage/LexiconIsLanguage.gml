// feather ignore all
/// @param {Any} value
/// @return {Bool}
function LexiconIsLanguage(_lang) {
	return is_struct(_lang) && is_instanceof(_lang, __LexiconLanguageClass) && !is_instanceof(_lang, __LexiconLanguageDummyClass);
}