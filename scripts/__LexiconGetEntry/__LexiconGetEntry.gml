// feather ignore all
/// @ignore

/// @param {String} entry
/// @return {Struct.__LexiconTextElementClass}
function __LexiconGetEntry(_key) {
	static _global = __LexiconSystem();
	static _entries = _global.__entries;
	if (_key == "") {
		__LexiconError("Invalid key. Key cannot be null or empty. Got \"\"!");
		return undefined;
	}
	_entries[$ _key] ??= new __LexiconEntryClass(_key);

	//if (__LEXICON_ADD_TEXT_AS_ENTRIES) {
	//	if (_global.__languageLoaded) && (_global.__mainLanguage.language == __LEXICON_DEFAULT_LANGUAGE) {
	//		_global.__fileEntries[$ "text"] ??= {};
	//		if (is_undefined(_global.__fileEntries.text[$ _entry])) {
	//			// Validate against any variations
	//			if (array_get_index(_global.__fileVariations, _entry) == -1) {
	//				_global.__fileEntries.text[$ _entry] = _entry;
	//				var _buff = buffer_create(1, buffer_grow, 1);
	//				buffer_write(_buff, buffer_text, json_stringify(_global.__fileEntries, true));
	//				buffer_save(_buff, _global.__fileModifyPath);
	//				buffer_delete(_buff);
	//			}
	//		}
	//	}
	//}

	return _entries[$ _key];
}