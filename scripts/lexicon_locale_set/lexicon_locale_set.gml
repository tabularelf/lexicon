/// @func lexicon_locale_set
/// @param locale
/// @param [force_flush]
function lexicon_locale_set(_locale, _forceFlush) {
	// Clear entries
	__lexicon_reset();
	
	if (is_array(_locale)) {
		_locale = _locale[0]	
	}
	var _struct = __LEXICON_STRUCT.localeMap[$ _locale];
	
	if (_struct != undefined) {
		__LEXICON_STRUCT.locale = _locale;	
		__LEXICON_STRUCT.language = _struct.language;	
	
		// Load entries
		__lexicon_load_entries();
	} else {
		__LEXICON_STRUCT.locale = "unknown";
		__LEXICON_STRUCT.language =  "unknown";
	}
	
	_forceFlush = is_undefined(_forceFlush) ? true : _forceFlush;
	if (_forceFlush) lexicon_flush_cache();
}
