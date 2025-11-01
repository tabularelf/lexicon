// feather ignore all
/// @ignore
function __LexiconUpdateLanguage(_newLang, _async = true) {
	static _global = __LexiconSystem();
	static _plugInCallbacks = _global.__plugInCallbacks;
	
	var _current = LexiconLanguageGetCurrent();
	_global.__mainLanguage = _newLang;
	_global.__languageLoaded = false;
	array_foreach(_global.__languages, function(_lang) {
		_lang.__loaded = false;
	});


	__LexiconEntriesReset(_current);

	__LexiconCallbackFire(LexiconCallbackType.LANGUAGE_UPDATE, _current, _newLang);

	__LexiconUpdateEntries(_newLang, _async);

	__LexiconUpdateLanguageFallbacks(_newLang, _async);
	var _globalFallback = LexiconLanguageGet(LexiconGlobalFallbackGet());
	if (LexiconIsLanguage(_globalFallback) && (!_globalFallback.IsLoaded())) {
		// Check if it exists as a targeted fallback.
		if (array_get_index(_newLang.GetFallbacks(), LexiconGlobalFallbackGet()) == -1) {
			__LexiconUpdateEntries(_globalFallback, _async);
			if (!_async) {
				_globalFallback.__loaded = true;
			}
		}
	}

	if (!_async) {
		_global.__languageLoaded = true;
		_newLang.__loaded = true;

		__LexiconCallbackFire(LexiconCallbackType.LANGUAGE_POST_UPDATE, _newLang);
	}
}