/// @func lexicon_text_array(text_pointer, array)
/// @param text_pointer
/// @param array
function lexicon_text_array(_text, _array) {
	// Feather ignore all
	var _arrayCopy;
	_arrayCopy[array_length(_array)-1] = 0;
	array_copy(_arrayCopy,0,_array,0,array_length(_array));
	array_insert(_arrayCopy,0,string(_text))
	var _value = script_execute_ext(lexicon_text, _arrayCopy);
	return _value;
}
