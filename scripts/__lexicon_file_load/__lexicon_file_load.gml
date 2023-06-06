/// @ignore
/// feather ignore all
function __lexicon_file_load(_file) {
	var _buffer = -1;
	if (_file.isFileLoaded() == true) return;
	if (_file.isAsync == true) {
		_buffer = buffer_create(1, buffer_grow, 1);
		var _id = buffer_load_async(_buffer, _file.fileName, 0, -1);
		__LEXICON_STRUCT.fileAsyncList[array_length(__LEXICON_STRUCT.fileAsyncList)] = [_id, _buffer, _file];
	} else {
		_buffer = buffer_load(_file.fileName);
		if (_buffer = -1) {
				__lexicon_throw("Invalid file " + string(_file.fileName));
			return;
		}
		
		var _string = buffer_read(_buffer, buffer_text);
		buffer_delete(_buffer);
		
		__lexicon_file_handle_load(_file, _string);
	}
}