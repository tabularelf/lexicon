/// @func lexicon_text_array(textEntry, array)
/// @param {String} textEntry
/// @param {Array} array
/// @return {String}
/// feather ignore all
function lexicon_text_array(_textEntry, _array) {
	var _arrayCopy;
	_arrayCopy[array_length(_array)-1] = 0;
	array_copy(_arrayCopy,0,_array,0,array_length(_array));
	/* Feather ignore once GM1043 */
	array_insert(_arrayCopy,0,string(_textEntry))
	var _value = script_execute_ext(lexicon_text, _arrayCopy);
	return _value;
}
