
/// @func lexicon_parse_csv
/// @param string
/// @param [cell_delimiter]
/// @param [string_delimiter]

// Juju made the original script (csv_to_grid). This was merely adapted to be used as a parser. 
// I cannot take full credit for this as a result.
function lexicon_parse_csv(_string, _cell_delimiter = ",", _string_delimiter = "\"") {
var _array = __lexicon_array2D_from_csv(_string, _cell_delimiter, _string_delimiter);
var _width = array_length(_array);
var _height = array_length(_array[0]);
var _language = lexicon_language_get(), _locale = lexicon_locale_get();

for(var _j = 1; _j < _height;  ++_j) {
	// Early exit
	if (_array[0][_j] == "Comments") continue;
	var _languageEntry = _array[0][_j];
	var _localeEntry = _array[1][_j];
	
	// Lets make sure that the language exists first
	if (_languageEntry != _language) {
		if (string_pos("[",_localeEntry) != 0) {
			var _localeArray = json_parse(_localeEntry);
			var _len = array_length(_localeArray);
			var _validEntry = false;
			for(var _a = 0; _a < _len; ++_a) {
				if (_localeArray[_a] == _locale) {
					_validEntry = true;
					break;
				}
			}
			
			if (_validEntry == false) {
				continue;
			}
			
		} else {
			if (_localeEntry != _locale) {
				continue;	
			}
		}
	}
	
	
	for(var _i = 2; _i < _width; ++_i) {
		var _entry = _array[_i][_j];
		var _textPointer = _array[_i][0]
		lexicon_entry_add(_textPointer, _entry); 	
		/*switch(_array[_i][0]) {
			case "Language":
				_language = _array[_i][_j];
			break;
			
			case "Locale":
				_locale = _array[_i][ _j];
					if (lexicon_language_exists(_language) == false) && (lexicon_locale_exists(_locale) == false) {
						lexicon_add_language(_language,_locale);
					}
			break;
			
			default: 
					lexicon_entry_add(_locale, _array[_i][0], _array[_i][ _j]); 	
			break;
		}*/
	}
	break;
}
	return _locale;
}