/// @func lexicon_entry_remove(text_pointer)
// @param text_pointer
/// @param string
function lexicon_entry_remove(_textPointer) {
	variable_struct_remove(__LEXICON_STRUCT.textEntries, _textPointer);
}