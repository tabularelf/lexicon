// feather ignore all
function LexiconPlugInRegisterCallback(_type, _priority = -1, _callback) {
	static _global = __LexiconSystem();
	if (!_global.__allowRegisteringCallbacks) {
		__LexiconError("Cannot register callbacks outside of the plug-in initalization!");
		return;
	}

	if (_type >= LexiconCallbackType.LENGTH) {
		__LexiconError("Cannot register callbacks type beyond the length!");
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