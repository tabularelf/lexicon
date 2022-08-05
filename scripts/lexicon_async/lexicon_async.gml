/// @func lexicon_async()
function lexicon_async() {
	// Feather ignore all
	var _arrayFiles = __LEXICON_STRUCT.fileAsyncList;
	var _len = array_length(_arrayFiles);
	var _id = async_load[? "id"];
	for(var _i = 0; _i < _len; ++_i) {
		if (_arrayFiles[_i][0] == _id) {
			if async_load[? "status"] == false {
				__lexicon_throw(_arrayFiles[_i][2].filePath + " async load failed!");	
				buffer_delete(_arrayFiles[_i][1]);
				array_delete(_arrayFiles, _i, 1);
			} else {
				var _buffer = _arrayFiles[_i][1];
				var _string = buffer_read(_buffer, buffer_text);
				buffer_delete(_buffer);
		
				__lexicon_file_handle_load(_arrayFiles[_i][2], _string);	
				array_delete(_arrayFiles, _i, 1);
			}
		}
	}
}