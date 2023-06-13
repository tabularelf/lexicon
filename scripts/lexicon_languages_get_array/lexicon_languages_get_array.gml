/// @func lexicon_languages_get_array()
/// @param {Bool} returnStruct
/// feather ignore all
function lexicon_languages_get_array(_returnStruct = false) {
	static _structSort = function(_left, _right) {
		if (_left.language < _right.language) {
		    return -1;
		} else if (_left.language > _right.language) {
		    return 1;
		} else {
		    return 0;
		}
	}
	
	static _arraySort = function(_left, _right) {
		if (_left[0] < _right[0]) {
		    return -1;
		} else if (_left[0] > _right[0]) {
		    return 1;
		} else {
		    return 0;
		}
	}
	var _map = __LEXICON_STRUCT.languageMap;
	var _keys = variable_struct_get_names(_map);
	var _array = array_create(array_length(_keys));
	var _i = 0;
	if (_returnStruct) {
		repeat(array_length(_keys)) {
			_array[_i] = {
				language: _map[$ _keys[_i]].language,
				locale: _map[$ _keys[_i]].locale
			};
			++_i;
		}	
	} else {
		repeat(array_length(_keys)) {
			_array[_i][0] = _map[$ _keys[_i]].language;
			/* Feather ignore once GM1043 */
			_array[_i][1] = _map[$ _keys[_i]].locale;
			++_i;
		}	
	}
	
	if (_returnStruct) {
		array_sort(_array, _structSort);
	} else {
		array_sort(_array, _arraySort);
	}
	return _array;
}