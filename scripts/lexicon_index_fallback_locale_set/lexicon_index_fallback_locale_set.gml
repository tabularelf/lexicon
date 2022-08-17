/// @func lexicon_index_fallback_locale_set(fallbackLocale, locale)
/// @param {String} _fallbackLocale
/// @param {String} _locale
function lexicon_index_fallback_locale_set(_fallbackLocale, _locale) {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	if (__LEXICON_STRUCT.localeMap[$ _locale] == undefined) {
		__lexicon_throw("Attempted to set " + _fallbackLocale + " but " + _locale + " is not in the database!");	
	}
	
	__LEXICON_STRUCT.fallbackLocaleMap[$ _fallbackLocale] = __LEXICON_STRUCT.localeMap[$ _locale];
}