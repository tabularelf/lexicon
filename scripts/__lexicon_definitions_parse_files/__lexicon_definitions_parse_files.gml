/// Feather ignore all
/// @ignore

function __lexicon_definitions_parse_files(_definitionsFilePath, _fileStruct) {
	var _lastSlash = (string_count("\\", _definitionsFilePath) > 0) ? "\\" : ((string_count("/", _definitionsFilePath) > 0) ? "/" : undefined);
	var _filePath = "";
	if (!is_undefined(_lastSlash)) {
		_filePath = string_copy(_definitionsFilePath, 1, string_last_pos(_lastSlash, _definitionsFilePath));
	}
	
	// Check between three types
	
	if (is_array(_fileStruct)) {
		var _i = 0;
		repeat(array_length(_fileStruct)) {
			if (string_char_at(_fileStruct[_i][$ "filePath"], 1) == ".") {
				_fileStruct[_i][$ "filePath"] = _filePath + string_copy(_fileStruct[_i][$ "filePath"], 3, string_length(_fileStruct[_i][$ "filePath"]));
			}
			++_i;
		}
	} else if (is_string(_fileStruct)) {
		if (string_char_at(_fileStruct, 1) == ".") {
			_fileStruct = _filePath + string_copy(_fileStruct, 3, string_length(_fileStruct));
		}
	} else if (is_struct(_fileStruct)) {
		if (string_char_at(_fileStruct[$ "filePath"], 1) == ".") {
			_fileStruct[$ "filePath"] = _filePath + string_copy(_fileStruct[$ "filePath"], 3, string_length(_fileStruct[$ "filePath"]));
		}
	} 
	
	return _fileStruct;
}