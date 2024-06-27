function lexicon_text_get_utf8_array(_str, _includeDuplicates = false) {
	static _strBuff = buffer_create(1024, buffer_fixed, 1);
	var _byteLen = string_byte_length(_str);
	
	if (_byteLen == 0) return undefined;
	if (_byteLen > buffer_get_size(_strBuff)) {
		buffer_resize(_strBuff, _byteLen+1);	
	}
	
	buffer_seek(_strBuff, buffer_seek_start, 0);
	buffer_write(_strBuff, buffer_string, _str);
	
	// Jump back to start
	buffer_seek(_strBuff, buffer_seek_start, 0);
	var _array = [];
	
	repeat(string_length(_str)) {
		var _charCode = __lexicon_buffer_read_utf8(_strBuff);
		if (_charCode < 32) continue;
		
		var _i = 0;
		var _found = false;
		if (!_includeDuplicates) {
			repeat(array_length(_array)) {
				if (_array[_i] == _charCode) {
					_found = true;
					break;
				}
				++_i;
			}
		}
		
		if (!_found) {
			array_push(_array, _charCode);	
		}
	}
	
	return _array;
}