/// @func lexicon_index_add_json(language/locale, file_name, [is_async])
/// @param language/locale
/// @param file_name
/// @param[is_async]
/* Feather ignore once GM1042 */
function lexicon_index_add_json(_lang, _fileName, _async = false) { 
	// Ensure that it's loaded first!
	__lexicon_init();
	
	if !(file_exists(_fileName)) {
			__lexicon_throw(_fileName + "does not exist!");
		return;
	}
	
	// Get language from database
	var _struct = __LEXICON_STRUCT.languageMap[$ _lang];
	if (_struct == undefined) {
		_struct = __LEXICON_STRUCT.localeMap[$ _lang];	
	}
	
	if (_struct == undefined) {
			__lexicon_throw(_lang + " is not a valid language or locale!");
		return;
	}
	/* Feather ignore once GM1029 */
	var _file = new __lexicon_file(_struct.language, _struct.locale, LEXICON_FILE_TYPES.json.parser, _fileName, _async);
	_struct.files[array_length(_struct.files)] = _file;
}