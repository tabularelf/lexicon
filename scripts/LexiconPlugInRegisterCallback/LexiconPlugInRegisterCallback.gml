// feather ignore all
/// @param {Enum.LexiconCallbackType} type The type of callback event.
/// @param {Real | Undefined} priority The priority of the callback it should run at from others.
/// @param {Function} callback The callback to run.
function LexiconPlugInRegisterCallback(_type, _priority = -1, _callback = function(){}) {
	static _global = __LexiconSystem();
	if (!_global.__allowRegisteringCallbacks) {
		__LexiconError("Cannot register callbacks outside of the plug-in initalization!");
		return;
	}

	if (_type >= LexiconCallbackType.LENGTH) {
		__LexiconError("Cannot register callbacks type beyond the length!");
		return;
	}

	if (_type < 0) {
		__LexiconError("Cannot register callbacks type below 0!");
		return;
	}

	var _typeDb = _global.__plugInCallbacks[_type];
	
	array_push(_typeDb, {
		callback: _callback,
		priority: _priority,
	});

	array_sort(_typeDb, function(_a, _b) {
		return sign(_a.priority - _b.priority);
	});
}