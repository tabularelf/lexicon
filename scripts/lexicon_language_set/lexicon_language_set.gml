/// @func lexicon_language_set
/// @param {String} _language
/// @param {Bool} [_forceFlush=true]
function lexicon_language_set(_language, _forceFlush = true) {
	// Clear entries
	__lexicon_reset();
	
	// Load Language
	var _struct = __LEXICON_STRUCT.languageMap[$ _language];
	
	// Lets try finding a fallback language
	if (_struct == undefined) {
		var _fallbackLanguage = __LEXICON_STRUCT.languageMap[$ __LEXICON_STRUCT.fallbackLanguage];
		if (_fallbackLanguage != undefined) {
			_struct = _fallbackLanguage;	
		}
	}
	
	if (_struct != undefined) {
		__LEXICON_STRUCT.locale = is_array(_struct.locale) ? _struct.locale[0] : _struct.locale;	
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