function __LexiconTextSystem() {
	static _init = false;
	if (_init) return;

	_init = true;
	time_source_start(time_source_create(time_source_global, 60, time_source_units_frames, function() {
		static _cache = __LexiconTextCache();
		static _names = [];
		static _index = 0;
		var _len = ds_map_size(_cache);
		if (_len == 0) return;

		ds_map_keys_to_array(_cache, _names);
		var _currentFrame = LexiconPlugInGetFrame();
		var _t = get_timer();
		var _maxTime = _t + min(_len, 200);
		while((get_timer() <= _maxTime)) {
			_index = (_index + 1) % _len;
			var _elm = _cache[? _names[_index]];
			if (_elm.frame+60 <= _currentFrame) {
				ds_map_delete(_cache, _names[_index]);
				array_delete(_names, _index, 1);
				_len--;
			}
		}
		array_resize(_names, 0);

		//show_debug_message($"Total time: {(get_timer() - _t) / 1000}ms, Leftover {struct_names_count(_cache)}");
	}, [], -1));
}

function __LexiconTextCache() {
	static _init = __LexiconTextSystem();
	static _cache = ds_map_create();
	return _cache;
}