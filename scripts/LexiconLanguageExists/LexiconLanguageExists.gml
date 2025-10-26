// feather ignore all
/// @param {String} language
function LexiconLanguageExists(_lang) {
	return !is_undefined(LexiconLanguageGet(_lang));
}