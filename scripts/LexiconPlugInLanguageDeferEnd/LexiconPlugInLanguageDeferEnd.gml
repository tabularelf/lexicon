function LexiconPlugInLanguageDeferEnd() {
	static _global = __LexiconSystem();
	if (!_global.__languageLoaded) {
		__LexiconError($"Cannot call {nameof(LexiconPlugInLanguageDeferEnd)}() when a language is in progress!");
	}

	if (!_global.__deferred) {
		__LexiconError($"Cannot call {nameof(LexiconPlugInLanguageDeferEnd)}() when there was no deferring!");
	}

	_global.__deferred = false;
	__LexiconCallbackFire(LexiconCallbackType.LANGUAGE_POST_UPDATE, _global.__mainLanguage);
}