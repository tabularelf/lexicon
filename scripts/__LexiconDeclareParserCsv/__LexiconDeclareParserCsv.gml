function __LexiconDeclareParserCsv(_buff, _file) {
	var _grid = __LexiconArray2DFromCsv(buffer_read(_buff, buffer_text));
	var _width = array_length(_grid);
	var _height = array_length(_grid[0]);
	for(var _j = 1; _j < _height;  ++_j) {
		
		if (string_lower(_grid[0][_j]) == "comments") {
				continue;
		}

		var _lang = _grid[0][_j];
		var _locale = _grid[1][_j];
		var _fallbacks = _grid[2][_j];
		if (_fallbacks == "") {
			_fallbacks = undefined;
		}
	
		if (string_pos(",", _locale) > 0) {
			_locale = string_split(_locale, ",");
			array_map_ext(_locale, function(_elm, _index) {
				return string_trim(_elm);
			});
		}

		if (string_pos(",", _fallbacks) > 0) {
			_fallbacks = string_split(_fallbacks, ",");
			array_map_ext(_fallbacks, function(_elm, _index) {
				return string_trim(_elm);
			});
		}

		var _langEntry = LexiconLanguageGet(_lang);
		if (!is_undefined(_langEntry)) {
			if (is_array(_locale)) {
				if (array_get_index(_locale, _langEntry.GetLocale()) != -1) {
					_langEntry.AddFile(_file);
				}
			} else {
				if (_langEntry.GetLocale() == _locale) {
					_langEntry.AddFile(_file);
				}
			}
		}
		
		if (is_array(_locale)) {
			while(array_length(_locale) > 0) {
				var _newLocale = array_shift(_locale);
				_langEntry = LexiconIndexDeclare(_lang, _newLocale);
				_langEntry.AddFile(_file);
				if (is_array(_fallbacks)) {
					_langEntry.AddFallbackExt(_fallbacks);
				} else if (is_string(_fallbacks)) {
					_langEntry.AddFallback(_fallbacks);
				}
			}
		} else {
			_langEntry = LexiconIndexDeclare(_lang, _locale);
			_langEntry.AddFile(_file);
			if (is_array(_fallbacks)) {
				_langEntry.AddFallbackExt(_fallbacks);
			} else if (is_string(_fallbacks)) {
				_langEntry.AddFallback(_fallbacks);
			}
		}
		
	}
}