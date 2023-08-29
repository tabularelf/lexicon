/// @func lexicon_language_set
/// @param {String} _language
/// @param {Bool} [_forceFlush=true]
function lexicon_language_set(_language, _forceFlush = true) {
	static _global = __lexicon_init();
	// Clear entries
	__lexicon_reset();
	
	// Load Language
	var _struct = _global.languageMap[$ _language];
	
	// Lets try finding a fallback language
	if (_struct == undefined) {
		var _fallbackLanguage = _global.languageMap[$ _global.fallbackLanguage];
		if (_fallbackLanguage != undefined) {
			_struct = _fallbackLanguage;	
		}
	}
	
	if (_struct != undefined) {
		_global.locale = is_array(_struct.locale) ? _struct.locale[0] : _struct.locale;	
		_global.language = _struct.language;
		
		// Load entries
		__lexicon_load_entries();
	} else {
		_global.locale = "unknown";
		_global.language =  "unknown";
	}
	
	/* Feather ignore once GM2047 */
	if (__LEXICON_FORECE_LOAD_FALLBACK_LANGUAGE) {
		var _fallbackLocale = is_array(_global.languageMap[$ _global.fallbackLanguage].locale) ? _global.languageMap[$ _global.fallbackLanguage].locale[0] : _global.languageMap[$ _global.fallbackLanguage].locale;
		_global.forceLoadFile = true;
		__lexicon_load_entries(_fallbackLocale);
		_global.forceLoadFile = false;
	}
	
	_global.cacheUpdate = true;
	
	if (_forceFlush) lexicon_flush_cache();
}