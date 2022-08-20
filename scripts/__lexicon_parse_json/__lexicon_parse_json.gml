/// Feather ignore all
/// @ignore
function __lexicon_parse_json(_json) {
	
	try {
		var _map = json_parse(_json);
	} catch(_ex) {
		__lexicon_throw("Language JSON invalid! " + _ex.message);
	}
	
	if (__LEXICON_STRUCT.language != _map.language) && (!__LEXICON_STRUCT.forceLoadFile) {
			__lexicon_trace("language is " + __LEXICON_STRUCT.language + " where it expected " + _map.language);
		return;
	}
	
	var _locale = _map.locale;
	if is_array(_locale) {
			var _validLocale = false;
			var _len = array_length(_locale);
			for(var _i = 0; _i < _len; ++_i) {
				if( __LEXICON_STRUCT.locale == _locale[_i]) {
					_validLocale = true;	
					break;
				}
			}
			
			/*if (!_validLocale) {
				// No locale found?
				__lexicon_trace("locale is " + __LEXICON_STRUCT.locale + " where it expected one of these " + string(_locale));
				exit;
			}*/
	} else {
		/*if (__LEXICON_STRUCT.locale != _locale) {
				__lexicon_trace("locale is " + __LEXICON_STRUCT.locale + " where it expected " + _map.locale);
			return;	
		}*/
	}
	
	
	var _textStructPtr = _map.text;
	var _textArray = variable_struct_get_names(_textStructPtr);
	var _k = 0;
	repeat(array_length(_textArray)) {
		if (is_struct(_textStructPtr[$ _textArray[_k]])) {
			__lexicon_text_struct_to_string(_textArray[_k], _textStructPtr[$ _textArray[_k]]);
		} else {
			if ((LEXICON_REPLACE_ENTRIES) && (variable_struct_exists(__LEXICON_STRUCT.textEntries, _textArray[_k]))) {
					__LEXICON_STRUCT.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];	
			} else if (!variable_struct_exists(__LEXICON_STRUCT.textEntries, _textArray[_k])) {
				__LEXICON_STRUCT.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];	
			}
		}
		++_k;
	}
}