/// @func lexicon_index_add_json(language/locale, file_name, [is_async])
/// @param {String} _langLocale
/// @param {String} _fileName
/// @param {Bool} [_isAsync=false]
/* Feather ignore once GM1042 */
function lexicon_index_add_json(_langLocale, _fileName, _isAsync = false) { 
	// Ensure that it's loaded first!
	__lexicon_init();
	static _fileTypes = ___fileTypes();
	
	if !(file_exists(_fileName)) {
			__lexicon_throw(_fileName + "does not exist!");
		return;
	}
	
	// Get language from database
	var _struct = __LEXICON_STRUCT.languageMap[$ _langLocale] ?? __LEXICON_STRUCT.localeMap[$ _langLocale];

	
	if (_struct == undefined) {
			__lexicon_throw(_langLocale + " is not a valid language or locale!");
		return;
	}
	/* Feather ignore once GM1029 */
	var _file = new __lexicon_file(_struct.language, _struct.locale, _fileTypes.json.parser, _fileName, _isAsync);
	_struct.files[array_length(_struct.files)] = _file;
}