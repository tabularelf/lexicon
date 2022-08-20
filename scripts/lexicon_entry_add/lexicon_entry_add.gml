/// @func lexicon_entry_add(text_pointer, string)
/// @param _textEntry
/// @param _string
function lexicon_entry_add(_textEntry, _string) {
	if ((!LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textEntry))) exit;
	__LEXICON_STRUCT.textEntries[$ _textEntry] = _string;
}