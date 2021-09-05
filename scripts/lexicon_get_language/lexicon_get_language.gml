/// @func lexicon_get_language
function lexicon_get_language() {
	return LEXICON_STRUCT.lang_map[$ LEXICON_STRUCT.lang_type][$ "language"];
}