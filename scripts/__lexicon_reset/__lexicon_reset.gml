/// @ignore
/// feather ignore all
function __lexicon_reset() {
	
	if (__LEXICON_STRUCT.localeMap[$ __LEXICON_STRUCT.locale] == undefined) {
		return;
	}
	
	// Unload files
	var _files = __LEXICON_STRUCT.localeMap[$ __LEXICON_STRUCT.locale].files;
	var _i = 0;
	repeat(array_length(_files)) {
		_files[_i].isLoaded = false;	
		++_i;
	}
	
	__LEXICON_STRUCT.textEntries = {};
}