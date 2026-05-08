// feather ignore all
/// @param {String | Struct.__LexiconEntryClass} key 
function LexiconPlugInResetEntry(_key) {
	LexiconPlugInSetEntry(string_trim(_key), undefined, __LexiconLanguageDummy());
 }