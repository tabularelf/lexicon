
function lexicon_index_declare(_language, _locale) {
	var _struct = {
		language: _language,
		locale: _locale,
		files: [],	
	}
	
	static _firstEntry = false;
	
	if (LEXICON_STRUCT.localeMap == undefined) {
		LEXICON_STRUCT.languageMap = {};
		LEXICON_STRUCT.localeMap = {};
	}
	
	LEXICON_STRUCT.languageMap[$ _language] = _struct;
	LEXICON_STRUCT.localeMap[$ _locale] = _struct;
	
	if (_firstEntry == false) {
		lexicon_set_locale(_locale, false);
		_firstEntry = true;
	}
}