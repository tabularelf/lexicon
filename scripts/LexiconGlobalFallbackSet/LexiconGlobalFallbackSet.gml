// feather ignore all
function LexiconGlobalFallbackSet(_lang) {
	static _global = __LexiconSystem();
	_global.__fallback = _lang;
}