/// @func lexicon_index_fallback_locale_set(fallbackLocale, locale)
/// @param fallbackLocale
/// @param locale
function lexicon_index_fallback_locale_set(_fallbackLocale, _locale) {
	
	if (__LEXICON_STRUCT.localeMap[$ _locale] == undefined) {
		__lexicon_throw("Attempted to set " + _fallbackLocale + " but " + _locale + " is not in the database!");	
	}
	
	__LEXICON_STRUCT.fallbackLocaleMap[$ _fallbackLocale] = __LEXICON_STRUCT.localeMap[$ _locale];
}