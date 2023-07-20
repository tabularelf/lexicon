/// @ignore
function __lexicon_reset() {
	static _global = __lexicon_init();
	if (_global.localeMap[$ _global.locale] == undefined) {
		return;
	}
	
	// Unload files
	var _files = _global.localeMap[$ _global.locale].files;
	var _i = 0;
	repeat(array_length(_files)) {
		_files[_i].isLoaded = false;	
		++_i;
	}
	
	_global.textEntries = {};
	_global.textEntriesArray = {};
}