
function lexicon_index_definitions(_file) {
	var _buffer = buffer_load(_file);
	if (_buffer == -1) {
		__lexicon_throw("File " + string(_file) + " doesn't exist or is returning an invalid error.");
		return;
	}
	
	var _json = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	var _struct = json_parse(_json);
	if (_struct == -1) {
		__lexicon_throw("Definitions JSON invalid!");	
		return;
	}
	
	var _languages = variable_struct_get_names(_struct);

	for(var _j = 0; _j < array_length(_languages); ++_j) {
		// Get Lang type
		if (_languages[_j] == "Comment") continue;
		
		var _locale = _struct[$ _languages[_j]].locale;
		lexicon_index_declare(_languages[_j], _locale);
	}
}