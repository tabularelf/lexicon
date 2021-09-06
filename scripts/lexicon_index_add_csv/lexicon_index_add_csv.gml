/// @func lexicon_index_add_csv(language/locale, file_name, [is_async], [cell_delimiter], [string_delimiter])
/// @param language/locale
/// @param file_name
/// @param[is_async]
/// @param [cell_delimiter]
/// @param [string_delimiter]
function lexicon_index_add_csv(_lang, _fileName, _async = false, _cell_delimiter = ",", _string_delimiter = "\"") {
	if !(file_exists(_fileName)) {
		if (LEXICON_DEBUG) __lexicon_throw(_fileName + "does not exist!");
		return;
	}
	
	// Get language from database
	var _struct = __LEXICON_STRUCT.languageMap[$ _lang];
	if (_struct == undefined) {
		_struct = __LEXICON_STRUCT.localeMap[$ _lang];	
	}
	
	if (_struct == undefined) {
		if (LEXICON_DEBUG) __lexicon_throw(_lang + " is not a valid language or locale!");
		return;
	}
	
	var _file = new __lexicon_file(_struct.language, _struct.locale, LEXICON_FILE_TYPES.csv.parser, _fileName, _async, [_cell_delimiter, _string_delimiter]);
	_struct.files[array_length(_struct.files)] = _file;
}