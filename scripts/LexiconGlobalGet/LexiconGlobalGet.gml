function LexiconGlobalGet(_key) {
	var _globals = LexiconGlobalStructGet();
	return _globals[$ _key];
}