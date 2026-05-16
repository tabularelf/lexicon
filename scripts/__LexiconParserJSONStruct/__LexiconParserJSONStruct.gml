// feather ignore all
/// @ignore
function __LexiconParserJSONStruct(_inst, _file, _langEntry) {
	var _lang = _inst[$ "language"];

	if (_langEntry.GetLanguage() != _lang) {
		return false
	}

	var _locale = _inst[$ "locale"];
	var _textEntries = _inst[$ "text"];
	var _validLocale = _langEntry.GetLocale() == _locale;	

	if (is_array(_locale)) {
		var _i = 0;
		repeat(array_length(_locale)) {
			if (_langEntry.GetLocale() == _locale[_i]) {
				_validLocale = true;
				break;
			}
			++_i;
		}
	}

	if (!_validLocale) {
		return false;
	}

	var _entries = struct_get_names(_textEntries);
	var _i = 0;
	repeat(array_length(_entries)) {
		var _element = _textEntries[$ _entries[_i]];
		if (is_struct(_element)) {
			__LexiconIndexLoopStruct(_entries[_i], _element, _langEntry);
		} else if (is_array(_element)) {
			LexiconPlugInSetEntry(_entries[_i], undefined, _langEntry);
			__LexiconIndexLoopArray(_element, _entries[_i], _langEntry);
		} else {
			LexiconPlugInAddEntry(_entries[_i], _element, _langEntry);
		}	
		++_i;
	}

	return true;
}