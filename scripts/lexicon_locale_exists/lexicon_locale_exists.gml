/// @func lexicon_locale_exists(locale)
/// @param {String} locale
/// feather ignore all
function lexicon_locale_exists(_locale) {
	var _map = __LEXICON_STRUCT.localeMap;
	if (_map[$ _locale] != undefined) return true;
	return false;
}

