// feather ignore all
/// @param {String} key
/// @param {Array} args
/// @param {Real} offset
/// @param {Real} length
/// @return {Struct.__LexiconTextElementClass}
function LexiconExt(_key, _args, _offset = 0, _len = infinity) {
	static _argsArray = [];
	try {
		_len = clamp(_len, 0, array_length(_args)+1);
		_offset = clamp(_offset, 0, _len);
		array_copy(_argsArray, 1, _args, _offset, _len);
		_argsArray[0] = _key;
	

		return script_execute_ext(Lexicon, _argsArray, _offset, _len);
	} finally {
		array_resize(_argsArray, 0);
	}
}