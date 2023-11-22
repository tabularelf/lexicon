/// Feather ignore all
/// @ignore
function __lexicon_parse_csv(_string, _cellDelimiter = ",", _string_delimiter = "\"") {
var _array = __lexicon_array2D_from_csv(_string, _cellDelimiter, _string_delimiter);
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
		var _length = array_length(_array[_i])-1;
		if (_j > _length) continue;
		if (_array[_i][0] == __LEXICON_ROW_SEPERATOR) continue;
		var _entry = _array[_i][_j];
		if (_entry == "") continue;
		var _textPointer = _array[_i][0]
        if (_textPointer == "") continue; // Skipping any and all blank entries
		lexicon_entry_add(_textPointer, _entry); 	
	}
	break;
}
	return _locale;
}