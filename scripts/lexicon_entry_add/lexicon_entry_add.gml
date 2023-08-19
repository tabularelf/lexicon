/// @func lexicon_entry_add(textEntry, string)
/// @param {String} textEntry
/// @param {String} string
/// feather ignore all
function lexicon_entry_add(_textEntry, _string) {
    if (_textEntry == "") __lexicon_throw("textEntry shouldn't be a blank string in lexicon_entry_add!");
	if ((!LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textEntry))) return undefined;
	__LEXICON_STRUCT.textEntries[$ _textEntry] = _string;
}