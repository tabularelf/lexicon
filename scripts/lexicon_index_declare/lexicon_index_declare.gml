/// @func lexicon_index_declare(language, locale)
/// @param {String} language
/// @param {Any*} locale
/// @param {Any*} [fallbackLocale=undefined]
// Feather ignore all
function lexicon_index_declare(_language, _locale, _fallbackLocale = undefined) {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	if (variable_struct_exists(__LEXICON_STRUCT.languageMap, _language)) {
		__lexicon_trace(_language + " already exists!");
		return;	
	}
	
	var _struct = new __lexicon_definition_class(_language, _locale);
	
	static _firstEntry = LEXICON_USE_FIRST_ENTRY_ADDED == true ? false : true;
	
	__LEXICON_STRUCT.languageMap[$ _language] = _struct;
	if is_array(_locale) {
			var _len = array_length(_locale);
			var _i = 0;
			repeat(_len) {
				/* Feather ignore all GM1061 */
				__LEXICON_STRUCT.localeMap[$ _locale[_i]] = _struct;
				++_i;
			}
			
			/* Feather ignore once GM1061 */
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