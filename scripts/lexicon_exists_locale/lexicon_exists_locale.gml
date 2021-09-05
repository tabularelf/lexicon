/// @func lexicon_exists_locale
/// @param locale
function lexicon_exists_locale(_locale) {
	var _result = LEXICON_STRUCT.lang_map[$ _locale];
	return (_result == undefined) ? false : true;
}

