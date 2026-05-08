// feather ignore all
/// @param {String} keyA
/// @param {String} keyB
function LexiconPlugInAddVariation(_keyA, _keyB) {
	var _entry = __LexiconGetEntry(string_trim(_keyA));
	_entry.__variations ??= [];

	array_push(_entry.__variations, string_trim(_keyB));
}