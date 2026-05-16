// feather ignore all
function LexiconPlugInLanguageDefer() {
	static _global = __LexiconSystem();
	if (_global.__languageLoaded) {
		__LexiconError($"Cannot call {nameof(LexiconPlugInLanguageDefer)}() when a language is not in progress!");
	}

	_global.__deferred = true;
}