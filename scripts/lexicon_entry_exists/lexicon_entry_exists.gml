/// @func lexicon_entry_exists(textEntry)
/// @param {String} textEntry
/// feather ignore all
function lexicon_entry_exists(_textEntry){
	static _global = __lexicon_init();
	return variable_struct_exists(_global.textEntries, _textEntry);
}