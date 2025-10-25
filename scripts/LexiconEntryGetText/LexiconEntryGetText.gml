// feather ignore all
/// @param {String} entry
/// @return {String}
function LexiconEntryGetText(_entry) {
	static _entries = __LexiconSystem().__entries;
	var _textEntry = _entries[$ _entry];
	if (is_undefined(_textEntry)) {
		return _entry;
	}

	return _textEntry.__text ?? _entry;
}