function __lexicon_handle_file_type(_lang, _fileStruct) {
		var _filePath = _fileStruct.filePath;
		var _dotPos = string_pos(".", _filePath)+1;
		var _string = string_lower(string_copy(_filePath, _dotPos, string_length(_filePath)-_dotPos+1));
		
		if (LEXICON_FILE_TYPES[$ _string] != undefined) {
			var _type = LEXICON_FILE_TYPES[$ _string];
			var _args = undefined;
			
			if (_fileStruct[$ "arguments"] != undefined) {
				if !(is_array(_fileStruct.arguments)) {
					__lexicon_throw("Invalid arguments for file definitions. Defaulting to none.")	
				} else {
					_args = _fileStruct.arguments;	
				}
			}
			
			_type.adder(_lang, _filePath, _fileStruct.isAsync, _args);
		}
}