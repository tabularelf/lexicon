/// @func lexicon_index_definitions(filePath)
/// @param {String} filePath
/// feather ignore all
function lexicon_index_definitions(_filePath) {
	// Ensure that it's loaded first!
	__lexicon_init();
	
	var _buffer = buffer_load(_filePath);
	if (!buffer_exists(_buffer)) {
		__lexicon_throw("File " + string(_filePath) + " doesn't exist.");
		return;
	}
	
	var _json = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	try {
		var _struct = json_parse(_json);
	} catch(_ex) {
		__lexicon_throw("Definitions JSON invalid! " + string(_ex.message));	
	}
	
	var _languages = variable_struct_get_names(_struct);
	
	var _len = array_length(_languages);
	var _i = 0;
	var _j = 0;
	repeat(_len) {
		var _language = _languages[_i];
		var _locale = _struct[$ _languages[_i]].locale;
		var _fallbackLocale = (_struct[$ _languages[_i]][$ "fallbackLocale"]  != undefined) ? _struct[$ _languages[_i]].fallbackLocale : undefined;
		var _fallbackLanguage = (_struct[$ _languages[_i]][$ "fallbackLanguage"]  != undefined) ? _struct[$ _languages[_i]].fallbackLanguage : undefined;
		var _files;
		
		if _struct[$ _languages[_i]][$ "files"] != undefined {
			_files = __lexicon_definitions_parse_files(_filePath, _struct[$ _languages[_i]].files);
		} else if _struct[$ _languages[_i]][$ "file"] != undefined {
			_files = __lexicon_definitions_parse_files(_filePath, _struct[$ _languages[_i]].file);
		}
		
		if (!variable_struct_exists(__LEXICON_STRUCT.languageMap, _language)) {
			lexicon_index_declare(_language, _locale);
		} else {
			var _languageStruct = __LEXICON_STRUCT.languageMap[$ _language];
			
			// Check and add new locale to language
			if (is_array(_languageStruct.locale)) {
				array_push(_languageStruct.locale, _locale);	
			} else {
				_languageStruct.locale = [_languageStruct.locale];
				array_push(_languageStruct.locale, _locale);	
			}
			
			if (is_array(_locale)) {
				var _i = 0;
				repeat(array_length(_locale)) {
					__LEXICON_STRUCT.localeMap[$ _locale[0]] = _languageStruct;
					++_i;
				}
			} else {
				__LEXICON_STRUCT.localeMap[$ _locale] = _languageStruct;	
			}
		}
		
		if (_fallbackLocale != undefined) {
			if (is_array(_locale)) {
					/* Feather ignore once GM1061 */
					lexicon_index_fallback_locale_set(_fallbackLocale, _locale[0]);	
			} else {
				lexicon_index_fallback_locale_set(_fallbackLocale, _locale);		
			}
		}
		
		if (is_array(_files)) {
			var _fileLen = array_length(_files);
			repeat(_fileLen) {
				/* Feather ignore once GM1061 */
				__lexicon_handle_file_type(_language, _files[_j]);
				++_j
			}
		} else {
			__lexicon_handle_file_type(_language, _files);	
		}
		++_i;
	}
}