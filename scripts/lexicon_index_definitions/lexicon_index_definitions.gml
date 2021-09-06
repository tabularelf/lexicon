/// @func lexicon_index_definitions(file_path)
/// @param file_path
function lexicon_index_definitions(_filePath) {
	var _buffer = buffer_load(_filePath);
	if (_buffer == -1) {
		__lexicon_throw("File " + string(_filePath) + " doesn't exist.");
		return;
	}
	
	var _json = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	try {
		var _struct = json_parse(_json);
		var _languages = variable_struct_get_names(_struct);
		
		var _len = array_length(_languages);
		for(var _i = 0; _i < _len; ++_i) {
			// Get Lang type
			if (_languages[_i] == "Comment") continue;
			
			var _locale = _struct[$ _languages[_i]].locale;
			var _files = _struct[$ _languages[_i]].files;
			
			lexicon_index_declare(_languages[_i], _locale);
			
			// Check if struct or an array
			if (is_struct(_files)) {
					__lexicon_handle_file_type(_languages[_i], _files);
			} else if (is_array(_files)) {
				var _fileLen = array_length(_files);
				for(var _j = 0; _j < _fileLen; ++_j) {
						__lexicon_handle_file_type(_languages[_i], _files[_j]);
				}
			}
		}
	} catch(_ex) {
		if (LEXICON_DEBUG) __lexicon_throw("Definitions JSON invalid! " + string(_ex.message));	
		return;	
	}
}