// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_struct_merge(_src, _dest) {
	gml_pragma("forceinline");
	var _newDest = {};
	var _keys = variable_struct_get_names(_dest);
	var _i = 0;
	repeat(array_length(_keys)) {
		_newDest[$ _keys[_i]] = _dest[$ _keys[_i]];	
		++_i;
	}
	
	_keys = variable_struct_get_names(_src);
	_i = 0;
	repeat(array_length(_keys)) {
		_newDest[$ _keys[_i]] = _src[$ _keys[_i]];	
		++_i;
	}
	return _newDest;
}