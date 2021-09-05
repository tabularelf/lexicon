/// @func lexicon_exists_language
/// @param language
function lexicon_exists_language(_language) {
	var _map = LEXICON_STRUCT.languageMap;
	if (_map[$ _language] != undefined) return true;
	return false;
}