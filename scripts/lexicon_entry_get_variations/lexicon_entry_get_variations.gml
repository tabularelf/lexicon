function lexicon_entry_get_variations(_name) {
	static _global = __lexicon_init();
	var _entry = _global.textEntriesArray[$ _name];
	if (_entry == undefined) return undefined;
	var _array = array_create(array_length(_entry));
	array_copy(_array, 0, _entry, 0, array_length(_entry));
	return _array;
}