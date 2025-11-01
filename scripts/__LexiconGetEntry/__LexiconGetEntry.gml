// feather ignore all
/// @ignore

/// @param {String} entry
/// @return {Struct.__LexiconTextElementClass}
function __LexiconGetEntry(_key) {
	static _global = __LexiconSystem();
	static _entries = _global.__entries;

	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;
	static _ctx = {
		entry: undefined,
		text: undefined,
	};

	static _callback = method(_ctx, function(_elm) {
		text = _elm.callback(text, entry);
	});

	if (_key == "") {
		__LexiconError("Invalid key. Key cannot be null or empty. Got \"\"!");
		return undefined;
	}

	if (!struct_exists(_entries, _key)) {
		var _entry = new __LexiconEntryClass(_key);
		_entries[$ _key] = _entry;

		_ctx.entry = _entry;
		array_foreach(_plugInCallbacks[LexiconCallbackType.ENTRY_CREATED], _callback);	

		var _text = (is_string(_ctx.text) || is_undefined(_ctx.text)) ? _ctx.text : string(_ctx.text);
    	
		_entry.__entry = _ctx.entry;
		_entry.__text = _text;
		_entry.__variations = undefined;
		_entry.__isStatic = is_string(_text) ? string_pos("{", _text == 0) || string_pos("}", _text == 0) : true;
    	
		_ctx.entry = undefined;
		_ctx.text = undefined;
	}
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