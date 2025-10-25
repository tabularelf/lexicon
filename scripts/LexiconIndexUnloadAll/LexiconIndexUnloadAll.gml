// feather ignore all
function LexiconIndexUnloadAll() {
	static _global = __LexiconSystem();
	__LexiconEntriesReset(_global.__mainLanguage);
}