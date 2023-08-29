/// Feather ignore all
/// @ignore
function __lexicon_parse_json(_json) {
	static _global = __lexicon_init();
	try {
		var _map = json_parse(_json);
	} catch(_ex) {
		__lexicon_throw("Language JSON invalid! " + _ex.message);
	}
	
	if (_global.language != _map.language) && (!_global.forceLoadFile) {
			__lexicon_trace("language is " + _global.language + " where it expected " + _map.language);
		return;
	}
	
	var _locale = _map.locale;
	if is_array(_locale) {
		var _validLocale = false;
		var _len = array_length(_locale);
		for(var _i = 0; _i < _len; ++_i) {
			if( _global.locale == _locale[_i]) {
				_validLocale = true;	
				break;
			}
		}
	} 
	
	
	var _textStructPtr = _map.text;
	var _textArray = variable_struct_get_names(_textStructPtr);
	var _k = 0;
	repeat(array_length(_textArray)) {
		if (is_struct(_textStructPtr[$ _textArray[_k]])) {
			__lexicon_text_struct_to_string(_textArray[_k], _textStructPtr[$ _textArray[_k]]);
		} else if (is_array(_textStructPtr[$ _textArray[_k]])) {
			__lexicon_text_array_to_string(_textArray[_k], _textStructPtr[$ _textArray[_k]]);
		} else {
			if ((__LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(_global.textEntries, _textArray[_k]))) {
					_global.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];	
			} else if (!variable_struct_exists(_global.textEntries, _textArray[_k])) {
				_global.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];	
			}
		}
		++_k;
	}
}