// feather ignore all
function LexiconFontCacheFlush() {
	static _global = __LexiconSystem();
	_global.__forceResetFontCache = true;
}