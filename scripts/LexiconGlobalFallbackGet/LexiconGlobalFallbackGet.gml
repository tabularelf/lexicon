// feather ignore all
function LexiconGlobalFallbackGet() {
	static _global = __LexiconSystem();
	return _global.__fallback;
}