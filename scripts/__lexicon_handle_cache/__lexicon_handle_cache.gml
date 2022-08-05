// Feather ignore all
/// @ignore
function __lexicon_handle_cache() {
	// Keep track of frame
	if (LEXICON_USE_CACHE) && (LEXICON_AUTO_GC_CACHE) {
		static _frame = 0;
		static _cFrame = 0;

		// Perform first check
		if (_cFrame >= current_time) exit;

		// Perform second check
		_frame = ++_frame mod LEXICON_GC_NEXT_TICK;
		if (_frame != 0) exit;
	}


	with(__LEXICON_STRUCT) {
		var _length = ds_list_size(cacheList);
		var _i = 0;
		/*for(var _i = 0; _i < _length; ++_i)*/ repeat(_length) {
			var _deleteStruct = false;
			var _ref = cacheList[| _i];
			if !weak_ref_alive(_ref.ref) {
				_deleteStruct=  true;
			}
			if (current_time > cacheList[? _ref.cacheStr].timeStamp+LEXICON_CACHE_TIMEOUT) {
				_deleteStruct = true;
			}


			if (_deleteStruct) {
				ds_list_delete(cacheList,_i);
				delete cacheMap[? _ref.cacheStr];
				ds_map_delete(cacheList, _ref.cacheStr);
				--_i;
				//--_length;
				if (LEXICON_DEBUG) __lexicon_trace(_ref.cacheStr + " has been removed!");
			}
		}
	}

	_cFrame = current_time+1000;
}

