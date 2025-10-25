function LexiconGlobalSet(_key, _value) {
	var _globals = LexiconGlobalStructGet();
	_globals[$ _key] = _value;
}