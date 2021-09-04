/// @func lexicon_add_entry
/// @param locale
/// @param text_pointer
/// @param string
function lexicon_add_entry(_locale, _text_name, _text) {
	LEXICON_STRUCT.lang_map[$ _locale][$ "text"][$ _text_name] = _text;
}

/// @func lexicon_remove_entry
/// @param locale
/// @param text_pointer
function lexicon_remove_entry(_locale, _text_name) {
	variable_struct_remove(LEXICON_STRUCT.lang_map[$ _locale], _text_name);
}
