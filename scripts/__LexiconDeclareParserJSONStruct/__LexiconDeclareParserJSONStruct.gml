// feather ignore all
/// @ignore
function __LexiconDeclareParserJSONStruct(_inst, _file) {
	var _lang = _inst[$ "language"];
	var _locale = _inst[$ "locale"];
	var _fallback = _inst[$ "fallback"];
	var _langEntry;

	if (is_undefined(_lang)) {
		__LexiconTrace($"Invalid language name in \"{_file}\".");
		return;
	}

	if (is_undefined(_locale)) {
		__LexiconTrace($"Invalid locale in \"{_file}\".");
		return;
	}

	_lang = string_trim(_lang);
	
 	
	if (is_array(_locale)) {
		var _len = array_length(_locale);
		for(var _i = 0; _i < _len; ++_i) {
			var _localeCurrent = string_trim(_locale[_i]);
			_langEntry = LexiconLanguageGet(_localeCurrent);

			if (is_undefined(_langEntry)) {
			 	_langEntry = LexiconIndexDeclare(_lang, _localeCurrent);
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
		_locale = string_trim(_locale);
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