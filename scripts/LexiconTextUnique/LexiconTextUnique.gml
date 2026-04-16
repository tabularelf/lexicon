function LexiconTextUnique(_key, _unique = __LEXICON_TEXT_DEFAULT_UNIQUE_KEY) {
	static _cache = __LexiconTextCache();
	static _argsArray = [];
	var _keyUnique = _key + (is_string(_unique) ? _unique : string(_unique));
	var _result = _cache[? _keyUnique];

	if (is_undefined(_result)) {
		_result = {
			element: Lexicon(_key),
			frame: LexiconPlugInGetFrame(),
		};
		_cache[? _keyUnique] = _result;
	}

	_result.frame = LexiconPlugInGetFrame();
	
	if (argument_count > 2) {
		try {
			array_resize(_argsArray, argument_count-2);
			for(var _i = 2; _i < argument_count; ++_i) {
				_argsArray[_i-2] = argument[_i];
			}
        	
			var _args = _argsArray;
			with(_result.element) {
				method_call(Update, _args);
			}
		} finally {
			array_resize(_argsArray, 0);
		}
	} 
	
	return _result.element.Get();
}