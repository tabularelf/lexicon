/// Feather ignore all
/// @ignore
function __lexicon_load_entries(_locale) {
	static _global = __lexicon_init();
	// Load entries
	var _files = __LEXICON_STRUCT.localeMap[$ _locale ?? _global.locale].files;
	var _len = array_length(_files);
	for(var _i = 0; _i < _len; ++_i) {
		__lexicon_file_load(_files[_i]);
	}
}