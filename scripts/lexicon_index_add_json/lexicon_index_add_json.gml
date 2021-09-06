// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lexicon_index_add_json(_lang, _fileName, _async = false) {
	if !(file_exists(_fileName)) {
		__lexicon_throw(_fileName + "does not exist!");
		return;
	}
	
	// Get language from database
	var _struct = LEXICON_STRUCT.languageMap[$ _lang];
	if (_struct == undefined) {
		_struct = LEXICON_STRUCT.localeMap[$ _lang];	
	}
	
	if (_struct == undefined) {
		__lexicon_throw(_lang + " is not a valid language or locale!");
		return;
	}
	
	var _file = new __lexicon_file(_struct.language, _struct.locale, LEXICON_FILE_TYPES.json.parser, _fileName, _async);
	_struct.files[array_length(_struct.files)] = _file;
}