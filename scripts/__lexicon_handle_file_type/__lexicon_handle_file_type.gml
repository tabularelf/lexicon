/// @ignore
function __lexicon_handle_file_type(_lang, _fileStruct) {
		static _fileTypes = ___fileTypes();
		var _string = "";
		var _filePath = is_struct(_fileStruct) ? _fileStruct.filePath : _fileStruct;
		
		// Attempt to parse
		try {
			if (is_struct(_fileStruct) && _fileStruct[$ "fileType"] != undefined) {
				_string = string_lower(_fileStruct.fileType);
			} else {
				// Fallback
				var _dotPos = string_pos(".", _filePath)+1;
				_string = string_lower(string_copy(_filePath, _dotPos, string_length(_filePath)-_dotPos+1));
			}
			
			if (_fileTypes[$ _string] != undefined) {
				var _type = _fileTypes[$ _string];
				var _args = undefined;
				
				if (is_struct(_fileStruct)) {
					if (_fileStruct[$ "arguments"] != undefined) {
						if (is_array(_fileStruct.arguments)) {
							_args = _fileStruct.arguments;
						} 
					}
				}
				
				var _async;
				if (is_struct(_fileStruct)) {
					_async = _fileStruct[$ "isAsync"] != undefined ? _fileStruct.isAsync : false;
				} else {
					_async = false;	
				}
				
				_type.adder(_lang, _filePath, _async, _args);
			}
		// Potential error
		} catch(_ex) {
			__lexicon_throw("an unintentional error has occurred. Please let the developer know. " + string(_ex.message));	
		}
}