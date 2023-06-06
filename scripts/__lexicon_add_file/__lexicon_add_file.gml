/// @ignore
/// feather ignore all
function __lexicon_file(_language, _locale, _fileType, _fileName, _isAsync = false, _args = undefined) constructor{
		fileType = _fileType;
		fileName = _fileName;
		isAsync = _isAsync;
		args = _args;
		isLoaded = false;
		
		static isFileLoaded = function() {
			return (!__LEXICON_STRUCT.forceLoadFile) && (isLoaded);
		}
		
	if (_language == __LEXICON_STRUCT.language || _locale == __LEXICON_STRUCT.locale) {
		__lexicon_file_load(self);
	}
}