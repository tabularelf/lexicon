// feather ignore all
function LexiconPlugInGetAllEntriesNames(_returnValid = false) {
	static _entries = __LexiconSystem().__entries;
	var _results = struct_get_names(_entries);
	if (_returnValid) {
		array_resize(_results, array_filter_ext(_results, function(_key) {
			var _entry = LexiconPlugInGetEntry(_key);
			if (is_undefined(_entry)) return false;

			return is_string(_entry.GetText());
		}));
	}
	return _results;
}