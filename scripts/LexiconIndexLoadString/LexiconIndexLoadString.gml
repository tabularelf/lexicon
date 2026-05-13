// feather ignore all
/// @param {String} string
/// @param {String} extension
/// @param {String | Struct.__LexiconLanguageClass} language_or_locale
function LexiconIndexLoadString(_str, _ext, _lang = LexiconLanguageGetCurrent()) {
	var _buff;
	if (!is_string(_str)) {
		__LexiconError($"Expected \"String\", got \"{typeof(_str)}\"!");
		return;
	}

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