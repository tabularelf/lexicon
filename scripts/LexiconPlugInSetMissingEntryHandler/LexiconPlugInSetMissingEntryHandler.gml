function LexiconPlugInSetMissingEntryHandler(_callback) {
	static _global = __LexiconSystem();
	_global.__missingTextHandler = _callback;
}