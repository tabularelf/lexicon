/// @func lexicon_index_fallback_language_set(language)
/// @param {String} _language
function lexicon_index_fallback_language_set(_language) {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	if (__LEXICON_STRUCT.languageMap[$ _language] == undefined) {
		__lexicon_throw("Attempted to set fallback language but " + _language + " is not in the database!");	
	}
	
	__LEXICON_STRUCT.fallbackLanguage = _language;
}