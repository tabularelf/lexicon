/// @func lexicon_set_locale
/// @param locale
/// @param [force_flush]
function lexicon_set_locale(_locale, _forceFlush) {
	if (is_array(_locale)) {
		_locale = _locale[0]	
	}
	var _struct = LEXICON_STRUCT.localeMap[$ _locale];
	
	if (_struct != undefined) {
		LEXICON_STRUCT.locale = _locale;	
		LEXICON_STRUCT.language = _struct.language;	
	}
	
	// Load entries
	__lexicon_load_entries();
	
	_forceFlush = is_undefined(_forceFlush) ? true : _forceFlush;
	if (_forceFlush) lexicon_flush_cache();
}
