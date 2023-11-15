/// @func lexicon_index_declare_from_csv(filePath)
/// @param {String} _filePath
/// @param {String} [_cellDelimiter=","]
/// @param {String} [_stringDelimiter="\""]
// Feather ignore all
function lexicon_index_declare_from_csv(_filePath, _cellDelimiter = ",", _stringDelimiter = "\"") {
	// Ensure that it's loaded first!
	static _fileTypes = ___fileTypes();
	static _global = __lexicon_init();
	var _buffer = buffer_load(_filePath);
	var _string = buffer_read(_buffer, buffer_text);
	var _array = __lexicon_array2D_from_csv(_string, _cellDelimiter, _stringDelimiter);
	var _width = array_length(_array);
	var _height = array_length(_array[0]);
	var _file;
	
	for(var _j = 1; _j < _height;  ++_j) {
		// Early exit
		/* Feather ignore once GM1061 */
		if (_array[0][_j] == "Comments") continue;
		/* Feather ignore once GM1061 */
		var _languageEntry = _array[0][_j];
		/* Feather ignore once GM1061 */
		var _localeEntry = _array[1][_j];
		var _langStruct;
		
		// Lets make sure that the language exists first
		if (string_pos("[",_localeEntry) != 0) {
			var _locale = json_parse(_localeEntry);
		} else {
			var _locale = _localeEntry;	
		}
		
		var _language = _languageEntry;
		if is_array(_locale) {
			var _i = 0;
			repeat(array_length(_locale)) {
				/* Feather ignore once GM1061 */
				if (!variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale[_i]) && variable_struct_exists(__LEXICON_STRUCT.languageMap, _language)) {
					_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
					/* Feather ignore once GM1061 */
					__LEXICON_STRUCT.localeMap[$ _locale[_i]] = _langStruct;
					/* Feather ignore once GM1041 */
					/* Feather ignore once GM1061 */
				} else if (!variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale[_i])) {
					lexicon_index_declare(_language, _locale);	
					_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
				} else {
					/* Feather ignore once GM1061 */
					_langStruct = __LEXICON_STRUCT.localeMap[$ _locale[_i]];
				}
				
				_file = new __lexicon_file(_language, _locale[0], _fileTypes.csv.parser, _filePath);
				_langStruct.files[array_length(_langStruct.files)] = _file;
			}	
		} else {
			if (!(is_undefined(_language) || is_undefined(_locale))) && (variable_struct_exists(__LEXICON_STRUCT.languageMap, _language) || 
			variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale)) {
				_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
			} else {
				lexicon_index_declare(_language, _locale);	
				_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
			}
			
			_file = new __lexicon_file(_language, _locale, _fileTypes.csv.parser, _filePath);
			_langStruct.files[array_length(_langStruct.files)] = _file;
		}
	}
	buffer_delete(_buffer);
}


