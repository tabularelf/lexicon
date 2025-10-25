// feather ignore all
/// @ignore
function __LexiconEntriesReset(_oldLang){
	static _global = __LexiconSystem();
	static _entries = _global.__entries;
	static _asyncList = __LexiconFileAsyncList();
	struct_foreach(_entries, function(_name, _value) {
		static _dummy = __LexiconLanguageDummy();
		if (is_array(_value.__variations)) {
			delete _value.__variations;
		}
		_value.__text = undefined;
		_value.__language = _dummy;
	});

	var _asyncListLen = array_length(_asyncList);
	for(var _i = 0; _i < _asyncListLen; ++_i) {
		_asyncList[_i].cancelled = true;
	}

	if (_asyncListLen > 0) {
		__LexiconTrace($"Language was changed from {_oldLang} to {LexiconLanguageGetCurrent()} while files were loading! Preparing to cancel asynchronous jobs!");
	}
}