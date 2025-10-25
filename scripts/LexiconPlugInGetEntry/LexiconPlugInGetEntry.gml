// feather ignore all
function LexiconPlugInGetEntry(_entry) {
	static _entries = __LexiconSystem().__entries;
	return _entries[$ _entry];
}