/// @func lexicon_locale_set
/// @param {String} _locale
/// @param {Bool} [_forceFlush=true]
function lexicon_locale_set(_locale, _forceFlush = true) {
	static _global = __lexicon_init();
	// Clear entries
	__lexicon_reset();
	
	if (is_array(_locale)) {
		/* Feather ignore once GM1061 */
		_locale = _locale[0];
	}
	var _struct = _global.localeMap[$ _locale];
	
	// Lets try finding a fallback locale
	if (_struct == undefined) {
		var _fallbackLocale = _global.fallbackLocaleMap[$ string_copy(_locale, 1, 2)];
		if (_fallbackLocale != undefined) {
			if (is_array(_fallbackLocale.locale)) {
				_locale = _fallbackLocale.locale[0];	
			} else {
				_locale = _fallbackLocale.locale;	
			}
			
			_struct = _global.localeMap[$ _locale];
		}
	}
	
	// Lets try finding a fallback language
	if (_struct == undefined) {
		var _fallbackLanguage = _global.languageMap[$ _global.fallbackLanguage];
		if (_fallbackLanguage != undefined) {
			_struct = _fallbackLanguage;	
		}
	}
	
	if (__LEXICON_FORECE_LOAD_FALLBACK_LANGUAGE) {
		var _fallbackLocale = is_array(_global.languageMap[$ _global.fallbackLanguage].locale) ? _global.languageMap[$ _global.fallbackLanguage].locale[0] : _global.languageMap[$ _global.fallbackLanguage].locale;
		_global.forceLoadFile = true;
		__lexicon_load_entries(_fallbackLocale);
		_global.forceLoadFile = false;
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
	
	_global.cacheUpdate = true;
	
	if (_forceFlush) lexicon_flush_cache();
	
	//_global.langDB = __lexicon_localization_map_init()[$ _global.locale] ?? __lexicon_localization_map_init()[$ "en"];
}

