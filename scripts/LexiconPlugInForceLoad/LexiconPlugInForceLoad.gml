// feather ignore all
/// @desc Force loads the entire plugin system and all of the plugins.
function LexiconPlugInForceLoad() {
	if (self == global) {
		__LexiconError($"Cannot call \"{nameof(LexiconPlugInForceLoad)}\" inside of a script asset (or as global scope)!");
		return;
	}
	__LexiconPlugInsLoad();
}