// feather ignore all
/// @param {String | Undefined} language_or_locale The language or locale to set as the fallback.
function LexiconGlobalFallbackSet(_lang) {
	static _global = __LexiconSystem();
	_global.__fallback = _lang;
}