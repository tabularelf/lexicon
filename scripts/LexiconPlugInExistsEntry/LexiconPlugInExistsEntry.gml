// feather ignore all
/// @param {String} key 
function LexiconPlugInExistsEntry(_key) {
	static _entries = __LexiconSystem().__entries;
	var _entry = _entries[$ _key];
	return !is_undefined(_entry) && (is_string(_entry.__text));
}