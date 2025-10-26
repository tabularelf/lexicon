// feather ignore all
/// @param {String} language
function LexiconLanguageExists(_lang) {
	return LexiconIsLanguage(LexiconLanguageGet(_lang));
}