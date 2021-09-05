function lexicon_parse_json(_data) {
	if is_numeric(_data) && buffer_exists(_data) {
		var _json = buffer_read(_data, buffer_string);
	} else if is_string(_data) {
		var _json = _data;
	}
	
	var _map = json_parse(_json);
	if (_map != -1) {
		if is_array(_map) {
			
		} else {
			LEXICON_STRUCT.Language = _map.language;
			LEXICON_STRUCT.Locale = _map.locale;
			
			var _textStructPtr = _map.text;
			var _textArray = variable_struct_get_names(_textStructPtr);
			for(var _k = 0; _k < array_length(_textArray); ++_k) {
				LEXICON_STRUCT.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];
			}
		}
	} else {
		__lexicon_throw("Error! Language JSON invalid!");
	}
}