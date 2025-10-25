// feather ignore all
/// @ignore
/// @param {String} entry
function __LexiconGetVariations(_entry){
	static _entries = __LexiconSystem().__entries;
	var _result = _entries[$ _entry];
	if (is_undefined(_result.__variations)) {
		return undefined;
	}
	
	return _result.__variations;
}