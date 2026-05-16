// feather ignore all
/// @ignore
function __LexiconHotReloadTS() {
	if (!LexiconLanguageIsLoaded()) {
		return;
	}
	
	var _lang = LexiconLanguageGetCurrent();
	var _files = variable_clone(_lang.GetFiles(), 0);
	
	var _fallback = LexiconGlobalFallbackGet();
	if (!is_undefined(_fallback)) {
		if (!is_undefined(LexiconLanguageGet(_fallback))) {
			var _fallbackFiles = LexiconLanguageGet(_fallback).GetFiles();
			array_copy(_files, array_length(_files), _fallbackFiles, 0, array_length(_fallbackFiles));
		}
	}
 
	var _fallbacks = _lang.GetFallbacks();
	if (!is_undefined(_fallbacks)) {
		with({_files}) array_foreach(_fallbacks, function(_elm, _index) {
			var _fallback = LexiconLanguageGet(_elm);
			if (is_undefined(_fallback)) {
				return;
			}
			var _fallbackFiles = _fallback.GetFiles();
			array_copy(_files, array_length(_files), _fallbackFiles, 0, array_length(_fallbackFiles));
		});
	}

	var _i = 0;
	var _filesUpdated = false;
	repeat(array_length(_files)) {
		var _file = _files[_i];
		var _newHash = 	sha1_file(_file.filepath);
		if (_newHash != _file.hash) {
			_file.hash = _newHash;
			show_debug_message($"{_file.filepath} hash updated!");
			_filesUpdated = true;
		}		
		++_i;
	}

	if (_filesUpdated) {
		LexiconLanguageReload(false);
		LexiconHotReload();
	}
}