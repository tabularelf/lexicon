// feather ignore all
/// @param {String} key
/// @param {Any} value
function LexiconGlobalSet(_key, _value) {
	var _globals = LexiconGlobalStructGet();
	_globals[$ _key] = _value;
}