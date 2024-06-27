/// feather ignore all
/// @func lexicon_language_get_index
function lexicon_language_get_index() {
	static _global = __LEXICON_STRUCT;
	
	// Caching the array, because I'd save on performance..
	static _array = lexicon_languages_get_array(true);
	if (array_length(_array) != variable_struct_names_count(_global.languageMap)) {
		_array = lexicon_languages_get_array();
	}	
	
	var _current = lexicon_language_get();
	var _i = 0; 
	repeat(array_length(_array)) {
		var _len = _array[_i];
		if (_current == _len.language) {
			return _i;
		}
		
		_i++;
	}
	
	return -1;
}