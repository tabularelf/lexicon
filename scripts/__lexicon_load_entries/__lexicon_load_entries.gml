// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __lexicon_load_entries(){
	// Load entries
	var _files = __LEXICON_STRUCT.localeMap[$ __LEXICON_STRUCT.locale].files;
	var _len = array_length(_files);
	for(var _i = 0; _i < _len; ++_i) {
		__lexicon_file_load(_files[_i]);
	}
}