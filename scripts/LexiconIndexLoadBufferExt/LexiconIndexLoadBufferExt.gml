// feather ignore all
/// @param {ID.buffer} buffer
/// @param {String} extension
/// @param {Real} offset
/// @param {Real} length
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale
function LexiconIndexLoadBufferExt(_buff, _ext, _offset = 0, _length = infinity, _lang = LexiconLanguageGetCurrent()) {
	var _size = clamp(_length, 0, buffer_get_size(_buff)-_offset);
	var _tempBuff = buffer_create(_size, buffer_grow, 1);
	buffer_copy(_buff, _offset, clamp(_length, 0, buffer_get_size(_buff)-_offset), _tempBuff, 0);

	try {
		LexiconIndexLoadBuffer(_tempBuff, _ext, _lang);
	} finally {
		buffer_delete(_tempBuff);
	}
}