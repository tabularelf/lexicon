/// @func lexicon_get_languages
function lexicon_get_languages() {
	var _map = LEXICON_STRUCT.languageMap;
	var _array = [];
	var _key = variable_struct_get_names(_map);
	var _i = 0;
	while(_i < array_length(_key)) {
		_array[_i][0] = _map[$ _key[_i]].language;
		_array[_i][1] = _map[$ _key[_i]].locale;
		_i++;
	}
	return _array;
}