/// @func lexicon_languages_get_array()
function lexicon_languages_get_array() {
	var _map = __LEXICON_STRUCT.languageMap;
	var _array = [];
	var _key = variable_struct_get_names(_map);
	var _i = 0;
	while(_i < array_length(_key)) {
		_array[_i][0] = _map[$ _key[_i]].language;
		/* Feather ignore once GM1043 */
		_array[_i][1] = _map[$ _key[_i]].locale;
		_i++;
	}
	return _array;
}