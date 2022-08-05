/// @func lexicon_locale_set
/// @param locale
/// @param [force_flush]
// Feather ignore all
function lexicon_locale_set(_locale, _forceFlush = true) {
	// Clear entries
	__lexicon_reset();
	
	if (is_array(_locale)) {
		_locale = _locale[0];
	}
	var _struct = __LEXICON_STRUCT.localeMap[$ _locale];
	
	// Lets try finding a fallback locale
	if (_struct == undefined) {
		var _fallbackLocale = __LEXICON_STRUCT.fallbackLocaleMap[$ string_copy(_locale, 1, 2)];
		if (_fallbackLocale != undefined) {
			if (is_array(_fallbackLocale.locale)) {
				_locale = _fallbackLocale.locale[0];	
			} else {
				_locale = _fallbackLocale.locale;	
			}
			
			_struct = __LEXICON_STRUCT.localeMap[$ _locale];
		}
	}
	
	if (_struct != undefined) {
		__LEXICON_STRUCT.locale = _locale;	
		__LEXICON_STRUCT.language = _struct.language;	
	
		// Load entries
		__lexicon_load_entries();
	} else {
		__LEXICON_STRUCT.locale = "unknown";
		__LEXICON_STRUCT.language =  "unknown";
	}
	
	__LEXICON_STRUCT.cacheUpdate = true;
	
	if (_forceFlush) lexicon_flush_cache();
}

