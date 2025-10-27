function __LexiconParserCsv(_buff, _file, _langEntry) {
	var _grid = __LexiconArray2DFromCsv(buffer_read(_buff, buffer_text), __LEXICON_CSV_CELL_DELIMITER, __LEXICON_CSV_STRING_DELIMITER);
	var _width = array_length(_grid);
	var _height = array_length(_grid[0]);
	
	for(var _j = 1; _j < _height; ++_j) {
		if (string_lower(_grid[0][_j]) == "Comments") {
			continue;
		}

		var _language = _grid[0][_j];
		var _locale = _grid[1][_j];
	
		if (string_pos(",", _locale) > 0) {
			_locale = string_split(_locale, ",");
			array_map_ext(_locale, function(_elm, _index) {
				return string_trim(_elm);
			});
		}

		if (_langEntry.GetLanguage() != _language) {
			if (is_array(_locale)) {
				if (array_get_index(_locale, _langEntry.GetLocale()) == -1) {
					continue;
				}
			} else if (_langEntry.GetLocale() != _locale) {
				continue;
			}
		}

		for(var _i = 3; _i < _width; ++_i) {
			var _length = array_length(_grid[_i])-1;
			if (_j > _length) continue;
			if (string_starts_with(string_trim(_grid[_i][0]), __LEXICON_CSV_ROW_SEPERATOR) || (string_length(string_trim(_grid[_i][0])) == 0)) continue;
			var _text = _grid[_i][_j];
			if (_text == "") continue;
			var _key = _grid[_i][0];
			LexiconPlugInAddEntry(_key, _text, _langEntry);	
		}
		break;
	}
}
