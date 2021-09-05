
/// @func lexicon_parse_csv
/// @param string
/// @param [cell_delimiter]
/// @param [string_delimiter]

// Juju made the original script (csv_to_grid). This was merely adapted to be used as a parser. 
// I cannot take full credit for this as a result.
function lexicon_parse_csv(_localeChoice, _string, _cell_delimiter = ",", _string_delimiter = "\"") {
var _array = __lexicon_array2D_from_csv(_string, _cell_delimiter, _string_delimiter);
var _len = array_length(_array);
var _height = array_length(_array[0]);
var _language, _locale;

for(var _j = 1; _j < _height;  ++_j) {
	if (_array[0][_j] == "Comments") continue;
	for(var _i = 0; _i < _len; ++_i) {
		var _entry = _array[_i][_j];
		if (_entry == "Comments") continue;
		switch(_array[_i][0]) {
			case "Language":
				_language = _array[_i][_j];
			break;
			
			case "Locale":
				_locale = _array[_i][ _j];
					if (lexicon_exists_language(_language) == false) && (lexicon_exists_locale(_locale) == false) {
						lexicon_add_language(_language,_locale);
					}
			break;
			
			default: 
					lexicon_add_entry(_locale, _array[_i][0], _array[_i][ _j]); 	
			break;
		}
	}
}
	
	if (_is_buffer) {
		if (_using_own_buffer) {
			buffer_delete(_buff);
		}
		ds_grid_destroy(_grid);
	}

	return _locale;
}