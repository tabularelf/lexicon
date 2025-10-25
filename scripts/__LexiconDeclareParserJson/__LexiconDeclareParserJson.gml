function __LexiconDeclareParserJson(_buff, _file) {
	var _json = buffer_read(_buff, buffer_text);
	var _inst;
	_inst = json_parse(_json, function(_key, _value) {
		return _value;
	});

	var _lang = _inst[$ "language"];
	var _locale = _inst[$ "locale"];
	var _fallback = _inst[$ "fallback"];
	var _langEntry;
	
	if (is_array(_locale)) {
		var _len = array_length(_locale);
		for(var _i = 0; _i < _len; ++_i) {
			_langEntry = LexiconLanguageGet(_locale[_i]);

			if (is_undefined(_langEntry)) {
			 	_langEntry = LexiconIndexDeclare(_lang, _locale[_i]);
			}
			_langEntry.AddFile(_file)
			if (!is_undefined(_fallback)) {
				if (is_array(_langEntry)) {
					_langEntry.AddFallbackExt(_fallback);
				} else {
					_langEntry.AddFallback(string(_fallback));
				}
			}
		}
	} else {
		_langEntry = LexiconLanguageGet(_locale);

		if (is_undefined(_langEntry)) {
			 _langEntry = LexiconIndexDeclare(_lang, _locale);
		}

		_langEntry.AddFile(_file);

		if (!is_undefined(_fallback)) {
			if (is_array(_langEntry)) {
				_langEntry.AddFallbackExt(_fallback);
			} else {
				_langEntry.AddFallback(string(_fallback));
			}
		}
	}
}