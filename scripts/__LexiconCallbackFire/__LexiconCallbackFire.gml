// feather ignore all
/// @ignore
function __LexiconCallbackFire(_callbackType) {
	static _plugInCallbacks = __LexiconSystem().__plugInCallbacks;
	static _ctx = {
		args: [],
	};

	static _callback = method(_ctx, function(_elm, _index) {
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

	if (argument_count > 1) {
		try {
			var _i = 1;
			array_resize(_ctx.args, argument_count-1);
			repeat(argument_count-1) {
				_ctx.args[_i-1] = argument[_i];
				++_i;
			}

			array_foreach(_plugInCallbacks[_callbackType], _callback);
			return;
		} finally {
			array_resize(_ctx.args, 0);
		}
	}

	array_foreach(_plugInCallbacks[_callbackType], _callback);
}