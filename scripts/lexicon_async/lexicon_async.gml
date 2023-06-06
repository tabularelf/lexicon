/// @func lexicon_async()
/// feather ignore all
function lexicon_async() {
	var _arrayFiles = __LEXICON_STRUCT.fileAsyncList;
	var _len = array_length(_arrayFiles);
	var _id = async_load[? "id"];
	for(var _i = 0; _i < _len; ++_i) {
		/* Feather ignore once GM1061 */
		if (_arrayFiles[_i][0] == _id) {
			// Oh no the buffer is still small :(
			/* Feather ignore once GM1061 */
			var _buffer = _arrayFiles[_i][1];
			if (buffer_get_size(_buffer) <= 1) {
				/* Feather ignore once GM1061 */
				/* Feather ignore once GM1010 */
				__lexicon_trace(_arrayFiles[_i][2].filePath + " async load failed!");
				/* Feather ignore once GM1061 */
				buffer_delete(_buffer);
				array_delete(_arrayFiles, _i, 1);
			} else {
				/* Feather ignore once GM1061 */
				var _string = buffer_read(_buffer, buffer_text);
				buffer_delete(_buffer);
				
				/* Feather ignore once GM1061 */
				__lexicon_file_handle_load(_arrayFiles[_i][2], _string);	
				array_delete(_arrayFiles, _i, 1);
			}
		}
	}
}