// feather ignore all
function LexiconPlugInsAreLoaded() {
	static _system = __LexiconSystem();
	return _system.__plugInsLoaded;
}