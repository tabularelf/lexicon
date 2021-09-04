/// @func lexicon_text_array
/// @param text
/// @param array
function lexicon_text_array(_text, _array) {
	var _arrayCopy;
	_arrayCopy[array_length(_array)-1] = 0;
	array_copy(_arrayCopy,0,_array,0,array_length(_array));
	array_insert(_arrayCopy,0,string(_text))
	var _value = script_execute_ext(lexicon_text, _arrayCopy);
	return _value;
}
