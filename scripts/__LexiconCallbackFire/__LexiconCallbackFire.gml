// feather ignore all
/// @ignore
function __LexiconCallbackFire(_callbackType) {
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;
	static _ctx = {
		args: [],
	};

	static _callbackMultiple = method(_ctx, function(_elm, _index) {
		switch(array_length(args)) {
			case 0:
				_elm.callback();
			break;
			case 1:
				_elm.callback(args[0]);
			break;
			case 2:
				_elm.callback(args[0], args[1]);
			break;
			case 3:
				_elm.callback(args[0], args[1], args[2]);
			break;
			case 4:
				_elm.callback(args[0], args[1], args[2], args[3]);
			break;
		}
	}); 

	static _callback = function(_elm, _index) {
		_elm.callback();
	};

	if (argument_count > 1) {
		try {
			var _isRecursing = array_length(_ctx.args) > 0;
			
			var _args = _isRecursing ? [] : _ctx.args;
			var _oldArgs = _isRecursing ? _ctx.args : undefined;
			
			var _i = 1;
			array_resize(_args, argument_count-1);
			repeat(argument_count-1) {
				_args[_i-1] = argument[_i];
				++_i;
			}

			_ctx.args = _args;
			array_foreach(_plugInCallbacks[_callbackType], _callbackMultiple);
			return;
		} finally {
			if (_isRecursing) {
				delete _ctx.args;
				_ctx.args = _oldArgs;
			} else {
				array_resize(_ctx.args, 0);
			}
		}
	}

	array_foreach(_plugInCallbacks[_callbackType], _callback);
}