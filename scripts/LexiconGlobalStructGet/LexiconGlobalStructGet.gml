// feather ignore all
/// @return {Struct}
function LexiconGlobalStructGet() {
	static _global = __LexiconSystem();
	return _global.__globalVariableStruct;
}