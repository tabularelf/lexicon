/// @func lexicon_text_array(text_entry, array)
/// @param {String} _textEntry
/// @param {Array} _array
/// @return {String}
function lexicon_text_array(_textEntry, _array) {
	static _arrayCopy = [];
	var _len = array_length(_array);
	_arrayCopy[_len] = 0;
	array_copy(_arrayCopy,1,_array,0,_len);
	/* Feather ignore once GM1043 */
	_arrayCopy[0] = string(_textEntry);
	var _ar = _arrayCopy;
	var _value = script_execute_ext(lexicon_text, _arrayCopy, 0, _len+1);
	return _value;
}
