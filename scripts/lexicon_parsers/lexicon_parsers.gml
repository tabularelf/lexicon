
/// @func lexicon_add_async
/// @param filename
function lexicon_add_async(_filename) {
	return LEXICON_STRUCT.add_async(_filename);
}


/// @func lexicon_add
/// @param filename
function lexicon_add(_filename) {
	return LEXICON_STRUCT.add(_filename);
}

/// @func lexicon_async
function lexicon_async() {
	return LEXICON_STRUCT.async();	
}

// Parsers

/// @func lexicon_parse_json
/// @param string_or_buffer
function lexicon_parse_json(_string) {
	return LEXICON_STRUCT.parse_json(_string);
}