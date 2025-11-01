// feather ignore all
/// @param {Struct} struct The struct to set as the global struct.
function LexiconGlobalStructSet(_struct) {
	static _global = __LexiconSystem();
	if (!is_struct(_struct)) {
		__LexiconTrace($"Cannot set {typeof(_struct)} as a global struct! Must be a struct!");
		return;
	}

	_global.__globalVariableStruct = _struct;
}