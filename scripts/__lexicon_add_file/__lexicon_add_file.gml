// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_file(_language, _locale, _fileType, _fileName, _isAsync = false, _args = undefined) constructor{
		fileType = _fileType;
		fileName = _fileName;
		isAsync = _isAsync;
		args = _args;
		isLoaded = false;
		
	if (_language == __LEXICON_STRUCT.language || _locale == __LEXICON_STRUCT.locale) {
		__lexicon_file_load(self);
	}
}