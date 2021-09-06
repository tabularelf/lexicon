/// @func __lexicon_parse_json(json)
/// @param json
function __lexicon_parse_json(_json) {
	
	try {
		var _map = json_parse(_json);
		if is_array(_map) {
			
		} else {
			if (__LEXICON_STRUCT.language != _map.language) {
				if (LEXICON_DEBUG) __lexicon_throw("Error! language is " + __LEXICON_STRUCT.language + " where it expected " + _map.language);
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
					
					if !(_validLocale) {
						if (LEXICON_DEBUG) __lexicon_throw("locale is " + __LEXICON_STRUCT.locale + " where it expected " + string(_locale));
						return;		
					}
			} else {
				if (__LEXICON_STRUCT.locale != _locale) {
					if (LEXICON_DEBUG) __lexicon_throw("locale is " + __LEXICON_STRUCT.locale + " where it expected " + _map.locale);
					return;	
				}
			}
			
			
			var _textStructPtr = _map.text;
			var _textArray = variable_struct_get_names(_textStructPtr);
			for(var _k = 0; _k < array_length(_textArray); ++_k) {
				__LEXICON_STRUCT.textEntries[$ _textArray[_k]] = _textStructPtr[$ _textArray[_k]];
			}
		}
	} catch(_ex) {
			if (LEXICON_DEBUG) __lexicon_throw("Language JSON invalid! " + _ex.message);
	}
}