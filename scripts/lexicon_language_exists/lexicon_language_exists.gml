/// @func lexicon_language_exists
/// @param language
function lexicon_language_exists(_language) {
	var _map = __LEXICON_STRUCT.languageMap;
	if (_map[$ _language] != undefined) return true;
	return false;
}