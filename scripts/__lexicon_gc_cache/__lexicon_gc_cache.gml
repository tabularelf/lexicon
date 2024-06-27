/// Feather ignore all
/// @ignore
function __lexicon_gc_cache() {
	static _global = __lexicon_init();
	static _i = 0;
	// Keep track of frame
	var _frame = ++_global.frame;


	var _length = ds_list_size(_global.cacheList);
	if (_length == 0) exit;
	_i = _i % _length;
	var _totalTime = get_timer() + 50;
	repeat(_length) {
		var _deleteStruct = false;
		var _ref = _global.cacheList[| _i];
		if (is_undefined(_ref)) || (!weak_ref_alive(_ref.ref)) {
			_deleteStruct=  true;
		}
		
		if (!is_undefined(_ref)) {
			var _cache = _global.cacheMap[? _ref.cacheStr];
			if (!is_undefined(_cache)) {
				if (_frame > _cache.timeStamp+60) {
				    _deleteStruct = true;
				}
			} else {
				_deleteStruct = true;	
			}
		}

		if (_deleteStruct) {
			ds_list_delete(_global.cacheList,_i);
			ds_map_delete(_global.cacheMap, _ref.cacheStr);
			--_length;
			if (__LEXICON_VERBOSE) __lexicon_trace(_ref.cacheStr + " has been removed!");
		}
		if (_length == 0) break;
		if (get_timer() >= _totalTime) break;
		_i = (_i+1) % _length;
	}
}