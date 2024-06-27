/// @func lexicon_entry_remove(text_pointer)
/// @param {String} _textEntry
function lexicon_entry_remove(_textEntry) {
	variable_struct_remove(__LEXICON_STRUCT.textEntries, _textEntry);
}