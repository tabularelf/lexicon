// feather ignore all
function LexiconPlugInAddVariation(_name, _key) {
	static _global = __LexiconSystem();
	var _entry = __LexiconGetEntry(_name);
	_entry.__variations ??= [];

	array_push(_entry.__variations, _key);
}