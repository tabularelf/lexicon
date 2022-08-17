/// @func lexicon_entry_add(text_pointer, string)
// @param _textEntry
function lexicon_entry_add(_textEntry, _string) {
	__LEXICON_STRUCT.textEntries[$ _textEntry] = _string;
}