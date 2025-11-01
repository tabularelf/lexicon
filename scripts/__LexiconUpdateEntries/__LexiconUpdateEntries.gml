// feather ignore all
/// @ignore
function __LexiconUpdateEntries(_lang, _async = true) {
	// Load files
	var _files = _lang.GetFiles();
	var _len = array_length(_files);	
	if (_len == 0) {
		return;
	}

	for(var _i = 0; _i < _len; ++_i) {
		__LexiconLoadFile(_files[_i], _lang, _async);
	}
}