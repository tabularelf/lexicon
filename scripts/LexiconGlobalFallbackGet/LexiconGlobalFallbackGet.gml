// feather ignore all
/// @return {String | Undefined} 
function LexiconGlobalFallbackGet() {
	static _global = __LexiconSystem();
	return _global.__fallback;
}