
/// @func lexicon_get_languages
function lexicon_get_languages() {
	var _map = LEXICON_STRUCT.lang_map;
	var _array = [];
	var _key = variable_struct_get_names(_map);
	var _i = 0;
	while(_i < array_length(_key)) {
		_array[_i][0] = _map[$ _key[_i]][$ "language"];
		_array[_i][1] = _key[_i];
		_i++;
	}
	return _array;
}
	
/// @func lexicon_exists_locale
/// @param locale
function lexicon_exists_locale(_locale) {
	var _result = LEXICON_STRUCT.lang_map[$ _locale];
	return (_result == undefined) ? false : true;
}

/// @func lexicon_exists_language
/// @param language
function lexicon_exists_language(_language) {
	var _map = LEXICON_STRUCT.lang_map;
	var _mapArray = variable_struct_get_names(_map);
	var _i = 0;
	while(_i < array_length(_mapArray)) {
		var _ptr = _map[$ _mapArray[_i]];
		if(_ptr[$ "language"] == _language) {
			return true;
		}
		++_i;
	}
	return false;
}

/// @func lexicon_set_language
/// @param language
function lexicon_set_language(_string) {
	var _map = LEXICON_STRUCT.lang_map;
	var _mapArray = variable_struct_get_names(_map);
	var _i = 0;
	while(_i < array_length(_mapArray)) {
		var _ptr = _map[$ _mapArray[_i]];
		if(_ptr[$ "language"] == _string) {
			var _locale = _mapArray[_i];
			lexicon_set_locale(_locale);
			return true;
		}
		++_i;
	}
}

/// @func lexicon_get_language
function lexicon_get_language() {
	return LEXICON_STRUCT.lang_map[$ LEXICON_STRUCT.lang_type][$ "language"];
}

/// @func lexicon_add_language
/// @param language
/// @param locale
function lexicon_add_language(_lang_name, _locale) {
	LEXICON_STRUCT.lang_map[$ _locale] = {
		language: _lang_name,
		text: {}
	};
	
	return LEXICON_STRUCT.lang_map[$ _locale];
}

/// @func lexicon_remove_language
/// @param locale
function lexicon_remove_language(_locale) {
	return LEXICON_STRUCT.remove(_locale);	
}

/// @func lexicon_set_locale
/// @arg string
function lexicon_set_locale(_locale) {
	LEXICON_STRUCT.lang_type = _locale;	
}

/// @func lexicon_get_locale
function lexicon_get_locale() {
	return LEXICON_STRUCT.lang_type;	
}