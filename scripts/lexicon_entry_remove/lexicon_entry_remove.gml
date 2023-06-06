/// @func lexicon_entry_remove(textEntry)
/// @param {String} textEntry
/// feather ignore all
function lexicon_entry_remove(_textEntry) {
	variable_struct_remove(__LEXICON_STRUCT.textEntries, _textEntry);
}