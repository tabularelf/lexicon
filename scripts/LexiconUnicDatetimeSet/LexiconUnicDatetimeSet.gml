// feather ignore all
/// @param {Real, Undefined} datetime
function LexiconUnicDatetimeSet(_value) {
	static _inst = __LexiconUnicSystem();
	if (!is_numeric(_value)) && (!is_undefined(_value)) {
		__LexiconError($"Invalid type, expected numeric or undefined, got \"{typeof(_value)}\"!");
		return;
	}
	_inst.datetime = _value;
}