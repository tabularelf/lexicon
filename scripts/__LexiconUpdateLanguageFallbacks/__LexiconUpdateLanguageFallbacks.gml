// feather ignore all
/// @ignore
function __LexiconUpdateLanguageFallbacks(_newLang, _async) {
	var _fallbacks = _newLang.GetFallbacks(); 
	var _len = array_length(_newLang.__fallbacks)
	for(var _i = 0; _i < _len; ++_i) {
		var _langResult = __LexiconGetLocale(_fallbacks[_i]) ?? __LexiconGetLanguage(_fallbacks[_i]);
		if (LexiconIsLanguage(_langResult) && !_langResult.IsLoaded()) {
			__LexiconUpdateEntries(_langResult, _async);
			if (!_async) {
				_langResult.__loaded = true;
			}

			if (_langResult.FallbacksCount() > 0) {
				__LexiconUpdateLanguageFallbacks(_langResult, _async);
			}
		}
	}
}