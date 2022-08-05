/// @func lexicon_language_exists(language)
/// @param language
// Feather ignore all
function lexicon_language_exists(_language) {
	var _map = __LEXICON_STRUCT.languageMap;
	if (_map[$ _language] != undefined) return true;
	return false;
}