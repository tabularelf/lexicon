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