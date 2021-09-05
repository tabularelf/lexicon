/// @func lexicon_exists_locale
/// @param locale
function lexicon_exists_locale(_locale) {
	var _map = LEXICON_STRUCT.localeMap;
	if (_map[$ _locale] != undefined) return true;
	return false;
}

