// feather ignore all
function LexiconPlugInForceLoad() {
	if (self == global) {
		__LexiconError($"Cannot call \"{nameof(LexiconPlugInForceLoad)}\" inside of a script asset!");
		return;
	}
	__LexiconPlugInsLoad();
}