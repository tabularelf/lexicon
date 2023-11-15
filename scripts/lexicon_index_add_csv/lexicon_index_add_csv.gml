/// @func lexicon_index_add_csv(language/locale, file_name, [is_async], [cell_delimiter], [string_delimiter])
/// @param {String} _langLocale 
/// @param {String} _fileName
/// @param {Bool} [_isAsync=false]
/// @param {String} [_cellDelimiter=","]
/// @param {String} [_stringDelimiter="\""]
function lexicon_index_add_csv(_langLocale, _fileName, _isAsync = false, _cellDelimiter = ",", _stringDelimiter = "\"") {
	// Ensure that it's loaded first!
	static _fileTypes = ___fileTypes();
	static _global = __lexicon_init();
	
	if (!file_exists(_fileName)) {
			__lexicon_throw(_fileName + " does not exist!");
		return;
	}
	
	// Get language from database
	var _struct = __LEXICON_STRUCT.languageMap[$ _langLocale] ?? __LEXICON_STRUCT.localeMap[$ _langLocale];
	
	if (_struct == undefined) {
			__lexicon_throw(_langLocale + " is not a valid language or locale!");
		return;
	}
	
	var _file = new __lexicon_file(_struct.language, _struct.locale, _fileTypes.csv.parser, _fileName, _isAsync, [_cellDelimiter, _stringDelimiter]);
	_struct.files[array_length(_struct.files)] = _file;
}