/// @func lexicon_entry_add(textEntry, string)
/// @param {String} textEntry
/// @param {String} string
/// feather ignore all
function lexicon_entry_add(_textEntry, _string) {
	if ((!LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textEntry))) exit;
	__LEXICON_STRUCT.textEntries[$ _textEntry] = _string;
}