/// @func lexicon_set_language
/// @param language
/// @param [force_flush]
function lexicon_set_language(_string, _forceFlush) {
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