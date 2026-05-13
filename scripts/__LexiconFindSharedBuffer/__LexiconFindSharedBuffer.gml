function __LexiconFindSharedBuffer(_file) {
	static _global = __LexiconSystem();
	static _ctx = {
		file: undefined,
	};

	static _callback = method(_ctx, function(_elm, _index) {
		return _elm.file == file;
	});

	_ctx.file = _file;
	var _index = array_find_index(_global.__sharedBuffers, _callback);
	if (_index != -1) {
		return _global.__sharedBuffers[_index];
	}

	return undefined;
}