/// @func lexicon_entry_exists(textEntry)
/// @param {String} textEntry
/// feather ignore all
function lexicon_entry_exists(_textEntry){
	return variable_struct_exists(__LEXICON_STRUCT.textEntries, _textEntry);
}