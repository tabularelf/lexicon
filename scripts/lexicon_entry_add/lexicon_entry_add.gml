/// @func lexicon_entry_add(text_pointer, string)
/// @param _textEntry
/// @param _string
function lexicon_entry_add(_textEntry, _string) {
	static _global = __lexicon_init();
	if (_textEntry == "") __lexicon_throw("Text entry shouldn't be a blank string in lexicon_entry_add!");
	if ((!__LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(_global.textEntries, _textEntry))) return;
	_global.textEntries[$ _textEntry] = __LEXICON_RESOLVE_NEWLINES ? string_replace_all(_string, "\\n", "\n") : _string;
}