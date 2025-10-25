// feather ignore all
function LexiconGroup(_str) {
	return new __LexiconGroupClass(_str);
}

function __LexiconGroupTrace(_str) {
	show_debug_message($"Lexicon Group: {_str}");
}

function __LexiconGroupClass(_str) constructor {
	__mainEntry = _str;
	__cached = [];

	static ClearStatic = function() {
		array_resize(__cached, 0);
	}

	static GetStatic = function(_entry) {
		static _argArray = [];
		static _ctx = {
			key: "",
		};
		static _callback = method(_ctx, function(_elm, _index) {
			return _elm.GetKey() == key;
		});

		var _key = __mainEntry + "." + _entry;
		_ctx.key = _key;
		var _index = array_find_index(__cached, _callback);
	
		if (argument_count > 1) {
			try {
				array_resize(_argArray, argument_count);
				var _i = 1;
				_argArray[0] = __entries[$ _entry];
				repeat(argument_count-1) {
					_argArray[_i] = argument[_i];
					var _arg = _argArray[_i];
					++_i;
				}
        	
				if (_index != -1) {
					var _textCache = __cached[_index];
					var _args = _argArray;
					with(_textCache) {
						method_call(_textCache.Update, _args);
					}
			
					return _textCache;
				}
        	
				var _textCache = LexiconExt(_entry, _argArray);
				array_push(__cached, _textCache);
				return _textCache;
			} finally {
				array_resize(_argArray, 0);	
			}
		}

		if (_index != -1) {
			return __cached[_index];
		}

		var _textCache = Lexicon(_key);
		array_push(__cached, _textCache);
		return _textCache;
	}

	static Get = function(_entry) {
		static _argArray = [];
		var _key = __mainEntry + "." + _entry;
		if (argument_count > 1) {
			try {
				array_resize(_argArray, argument_count);
				_argArray[0] = _key;
				var _i = 1;
				repeat(argument_count-1) {
					_argArray[_i] = argument[_i];
					var _arg = _argArray[_i];
					++_i;
				}

				return script_execute_ext(Lexicon, _argArray);
			} finally {
				array_resize(_argArray, 0);	
			}
		}

		return Lexicon(_key);
	}
}