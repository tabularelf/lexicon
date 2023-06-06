/// @ignore
/// feather ignore all
function __lexicon_load_entries(_locale = __LEXICON_STRUCT.locale) {
	// Load entries
	var _files = __LEXICON_STRUCT.localeMap[$ _locale].files;
	var _len = array_length(_files);
	for(var _i = 0; _i < _len; ++_i) {
		__lexicon_file_load(_files[_i]);
	}
}