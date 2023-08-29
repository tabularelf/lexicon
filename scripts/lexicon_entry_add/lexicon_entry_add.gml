/// @func lexicon_entry_add(text_pointer, string)
/// @param _textEntry
/// @param _string
function lexicon_entry_add(_textEntry, _string) {
	if (_textEntry == "") __lexicon_throw("Text entry shouldn't be a blank string in lexicon_entry_add!");
	if ((!__LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textEntry))) return;
	__LEXICON_STRUCT.textEntries[$ _textEntry] = _string;
}