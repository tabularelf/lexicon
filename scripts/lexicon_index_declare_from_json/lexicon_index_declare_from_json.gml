/// @func lexicon_index_declare_from_json(filePath)
/// @param filePath
function lexicon_index_declare_from_json(_filePath) {
	// Feather ignore all
	// Ensure that it's loaded first!
	__lexicon_init();
	
	var _buffer = buffer_load(_filePath);
	var _json = buffer_read(_buffer, buffer_text);
	var _struct = undefined;
	
	try {
		_struct = json_parse(_json);
	} catch(_ex) {
		__lexicon_trace(_ex.message);	
	}
	
	if (_struct == undefined) {
		exit;	
	}
	
	var _language = _struct[$ "language"];
	var _locale = _struct[$ "locale"];
	var _localeExists = false;
	var _langStruct;
	var _file;
	
	if is_array(_locale) {
		var _i = 0;
		repeat(array_length(_locale)) {
			if !variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale[_i]) && (variable_struct_exists(__LEXICON_STRUCT.languageMap, _language)) {
				_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
				__LEXICON_STRUCT.localeMap[$ _locale[_i]] = _langStruct;
				_file = new __lexicon_file(_language, _locale, LEXICON_FILE_TYPES.json.parser, _filePath);
				_langStruct.files[array_length(_langStruct.files)] = _file;
			} else if !(variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale[_i])) {
				lexicon_index_declare(_language, _locale);
				_langStruct = __LEXICON_STRUCT.languageMap[$ _language];	
				_file = new __lexicon_file(_language, _locale, LEXICON_FILE_TYPES.json.parser, _filePath);
				_langStruct.files[array_length(_langStruct.files)] = _file;
			}
		}
	} else {
		if (!(is_undefined(_language) || is_undefined(_locale))) && (variable_struct_exists(__LEXICON_STRUCT.languageMap, _language) || 
		variable_struct_exists(__LEXICON_STRUCT.localeMap, _locale)) {
			_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
		} else {
			lexicon_index_declare(_language, _locale);
			_langStruct = __LEXICON_STRUCT.languageMap[$ _language];
		}
		
		_file = new __lexicon_file(_language, _locale, LEXICON_FILE_TYPES.json.parser, _filePath);
		_langStruct.files[array_length(_langStruct.files)] = _file;
	}
	buffer_delete(_buffer);
}


