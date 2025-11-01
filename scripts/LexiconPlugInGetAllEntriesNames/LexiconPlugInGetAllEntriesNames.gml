// feather ignore all
function LexiconPlugInGetAllEntriesNames() {
	static _entries = __LexiconSystem().__entries;
	return struct_get_names(_entries);
}