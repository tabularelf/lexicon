function LexiconPlugInLanguageIsDeferred() {
	static _global = __LexiconSystem();
	return _global.__deferred;
}