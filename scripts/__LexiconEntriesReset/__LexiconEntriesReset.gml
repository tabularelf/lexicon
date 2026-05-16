// feather ignore all
/// @ignore
function __LexiconEntriesReset(_oldLang){
	static _global = __LexiconSystem();
	static _entries = _global.__entries;
	static _asyncList = __LexiconFileAsyncList();
	struct_foreach(_entries, function(_name, _value) {
		static _dummy = __LexiconLanguageDummy();
		LexiconPlugInSetEntry(_name, undefined, _dummy);
	});

	var _asyncListLen = array_length(_asyncList);
	for(var _i = 0; _i < _asyncListLen; ++_i) {
		_asyncList[_i].cancelled = true;
	}

	with(__LexiconManager) {
		_asyncListLen += array_length(fileList);
		array_foreach(fileList, function(_elm) {
			_elm.cancelled = true;
			if (buffer_exists(_elm.entry.buff)) buffer_delete(_elm.entry.buff);
		});

		__LexiconManagerCleanUp(false);
	}

	if (_asyncListLen > 0) {
		__LexiconTrace($"Language was changed from {_oldLang} to {LexiconLanguageGetCurrent()} while files were loading! Preparing to cancel asynchronous jobs!");
	}
}