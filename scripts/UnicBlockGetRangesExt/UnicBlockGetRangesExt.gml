// Feather disable all

/// Returns a count of all the valid character block ranges, based on the provided string characters.
/// The provided array is updated as well to include these character block ranges at the end.
/// These character block ranges are derived from https://www.unicode.org/charts/, and Blocks.txt respectively.
/// 
/// @param {Array} array
/// @param {String} string
/// @param {String} ...
/// @return {Real}
function UnicBlockGetRangesExt(_array, _str) {
	static _ctx = {
		_results: undefined,
		_count: 0,
		min: infinity,
		max: -infinity,
		addedEntry: false,
	}

	static _callback = function(_char, _pos) {
		static _db = __UnicDatabaseBlocks();
		static _len = array_length(_db);
		static _cachePos = 0;
		var _charCode = ord(_char);
		// Very early exit
		if (addedEntry) {
			if (_charCode >= self.min && _charCode <= self.max) {
				return;
			}
		}

		// Cache handling, speeds up character codes that are apart of a similar group.
		var _entry = _db[_cachePos];
		var _min = _entry.min;
		var _max = _entry.max;
		if (_charCode >= _min && _charCode <= _max) {
			// Entry found, add if dupe doesn't exist and exit!
			if (array_get_index(_results, _entry) == -1) {
				array_push(_results, _entry);
				addedEntry = true;
				++_count;
			}
			self.min = _min;
			self.max = _max;
			return;
		}

		for(var _i = 0; _i < _len; ++_i) {
			_entry = _db[_i];
			_min = _entry.min;
			_max = _entry.max;
			if (_charCode >= _min && _charCode <= _max) {
				// Entry found, add if dupe doesn't exist and exit!
				if (array_get_index(_results, _entry) == -1) {
					array_push(_results, _entry);
					addedEntry = true;
					++_count;
				}
				_cachePos = _i;
				self.min = _min;
				self.max = _max;
				return;
			}
		}
	};


	_ctx._results = _array;
	_ctx._count = 0;
	_ctx.min = infinity;
	_ctx.max = -infinity;
	_ctx.addedEntry = false;
	with(_ctx) {
		for(var _i = 1; _i < argument_count; ++_i) {
			string_foreach(argument[_i], _callback);
		}
	}
	_ctx._results = undefined;
	return _ctx._count;
}