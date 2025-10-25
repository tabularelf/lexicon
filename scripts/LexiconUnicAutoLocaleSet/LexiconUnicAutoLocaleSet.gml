// feather ignore all
/// @param {Bool} value
function LexiconUnicAutoLocaleSet(_value) {
	static _global = __LexiconUnicSystem();
	if (!is_bool(_value)) {
		__LexiconError($"Invalid type. Expected \"Bool\", got \"{typeof(_value)}\"!");
		return;
	}

	_global.autoLocale = _value;
}