/// @func lexicon_index_declare(language, locale)
/// @param language
/// @param locale
function lexicon_index_declare(_language, _locale, _fallbackLocale = undefined) {
	var _struct = {
		language: _language,
		locale: _locale,
		files: [],	
	}
	
	static _firstEntry = LEXICON_USE_FIRST_ENTRY_ADDED == true ? false : true;
	
	__LEXICON_STRUCT.languageMap[$ _language] = _struct;
	if is_array(_locale) {
			var _len = array_length(_locale);
			for(var _i = 0; _i < _len; ++_i) {
				__LEXICON_STRUCT.localeMap[$ _locale[_i]] = _struct;
			}
			
			_locale = _locale[0];
	} else {
		__LEXICON_STRUCT.localeMap[$ _locale] = _struct;
	}
	
	if (_fallbackLocale != undefined) {
		lexicon_index_fallback_locale_set(_fallbackLocale, _locale);	
	}
	
	if (_firstEntry == false) {
		lexicon_locale_set(_locale, false);
		_firstEntry = true;
	}
}