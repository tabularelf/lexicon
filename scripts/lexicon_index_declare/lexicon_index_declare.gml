
function lexicon_index_declare(_language, _locale) {
	var _struct = {
		language: _language,
		locale: _locale,
		files: [],	
	}
	
	static _firstEntry = false;
	
	LEXICON_STRUCT.languageMap[$ _language] = _struct;
	if is_array(_locale) {
			var _len = array_length(_locale);
			for(var _i = 0; _i < _len; ++_i) {
				LEXICON_STRUCT.localeMap[$ _locale[_i]] = _struct;
			}
			_locale = _locale[0];
	} else {
		LEXICON_STRUCT.localeMap[$ _locale] = _struct;
	}
	
	if (_firstEntry == false) {
		lexicon_set_locale(_locale, false);
		_firstEntry = true;
	}
}