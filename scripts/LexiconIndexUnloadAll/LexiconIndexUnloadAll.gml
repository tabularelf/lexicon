// feather ignore all
/// @desc Unloads all entries, and cancels all asynchronous jobs.
function LexiconIndexUnloadAll() {
	static _global = __LexiconSystem();
	__LexiconEntriesReset(_global.__mainLanguage);
}