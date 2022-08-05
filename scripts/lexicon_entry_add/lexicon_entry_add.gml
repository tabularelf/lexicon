/// @func lexicon_entry_add(text_pointer, string)
/// @param text_pointer
/// @param string
// Feather ignore all
function lexicon_entry_add(_textPointer, _string) {
	__LEXICON_STRUCT.textEntries[$ _textPointer] = _string;
}