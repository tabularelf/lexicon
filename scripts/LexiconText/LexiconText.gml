// feather ignore all
/// @param {String} key The key to fetch the text from
/// @param {Any} ... The variables you wish to pass to the Lexicon cached text element
/// @return {String}
function LexiconText(_key) {
	static _cache = __LexiconTextCache();
	static _argsArray = [];
	var _result = _cache[? _key];

	if (is_undefined(_result)) {
		_result = {
			element: Lexicon(_key),
			frame: LexiconPlugInGetFrame(),
		};
		_cache[? _key] = _result;
	}

	_result.frame = LexiconPlugInGetFrame();
	
	if (argument_count > 1) {
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