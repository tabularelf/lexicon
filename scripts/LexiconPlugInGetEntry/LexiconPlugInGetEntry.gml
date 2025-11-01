// feather ignore all
/// @param {String} key
function LexiconPlugInGetEntry(_entry) {
	static _entries = __LexiconSystem().__entries;
	return _entries[$ _entry];
}