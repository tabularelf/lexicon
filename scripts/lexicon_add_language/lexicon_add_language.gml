/// @func lexicon_add_language
/// @param language
/// @param locale
function lexicon_add_language(_lang_name, _locale) {
	LEXICON_STRUCT.lang_map[$ _locale] = {
		language: _lang_name,
		text: {}
	};
	
	return LEXICON_STRUCT.lang_map[$ _locale];
}
