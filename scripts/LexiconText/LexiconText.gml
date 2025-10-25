
function LexiconText(_key, _unique = "default") {
	static _cache = __LexiconTextCache();
	static _argsArray = [];
	var _hash = variable_get_hash(_key + (is_string(_unique) ? _unique : string(_unique)));
	var _result;

	if (!struct_exists_from_hash(_cache, _hash)) {
		_result = Lexicon(_key);
		struct_set_from_hash(_cache, _hash, {
			element: _result,
			frame: LexiconPlugInGetFrame(),
		});
	}

	_result = struct_get_from_hash(_cache, _hash);
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

function __LexiconTextSystem() {
	static _init = false;
	if (_init) return;

	_init = true;
	time_source_start(time_source_create(time_source_global, 60, time_source_units_frames, function() {
		static _cache = __LexiconTextCache();
		static _index = 0;
		var _len = struct_names_count(_cache);
		if (_len == 0) return;

		var _names = struct_get_names(_cache);
		var _currentFrame = LexiconPlugInGetFrame();
		var _t = get_timer();
		var _maxTime = _t + min(_len, 200);
		while((get_timer() <= _maxTime)) {
			_index = (_index + 1) % _len;
			var _elm = _cache[$ _names[_index]];
			if (_elm.frame+60 <= _currentFrame) {
				struct_remove(_cache, _names[_index]);
				array_delete(_names, _index, 1);
				_len--;
			}
		}

		//show_debug_message($"Total time: {(get_timer() - _t) / 1000}ms, Leftover {struct_names_count(_cache)}");
	}, [], -1));
}

function __LexiconTextCache() {
	static _init = __LexiconTextSystem();
	static _cache = {};
	return _cache;
}