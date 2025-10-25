// feather ignore all
function LexiconIndexLoadString(_str, _ext, _lang = LexiconLanguageGetCurrent()) {
	var _buff;
	try {
		_buff = buffer_create(string_byte_length(_str), buffer_fixed, 1);
		buffer_write(_buff, buffer_text, _str);
		buffer_seek(_buff, buffer_seek_start, 0);
		LexiconIndexLoadBuffer(_buff, _ext, _lang);
		return;
	} finally {
		buffer_delete(_buff);
	}
}