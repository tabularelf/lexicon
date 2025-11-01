// feather ignore all
/// @param {String | Struct.__LexiconEntryClass} key 
/// @param {String | Undefined} text
/// @param {Struct.__LexiconLanguageClass} languageInstance
function LexiconPlugInAddEntry(_key, _text, _language) {
	var _entry = LexiconIsEntry(_key) ? _key : __LexiconGetEntry(_key);
	
	if (is_undefined(_entry.__text)) {
		LexiconPlugInSetEntry(_entry, _text, _language);
	} else if (__LEXICON_VERBOSE) {
		__LexiconTrace($"Key \"{_key}\" has already been defined!");
	}
 }