// feather ignore all
/// @ignore
function __LexiconLoadFile(_file, _lang, _async = true) {
	static _ts = __LexiconSystem().__asyncTs;
	static _list = __LexiconFileAsyncList();
	static _global = __LexiconSystem();

	var _fileInSharedBuffer = false;

	// Load instantly
	if (!_async) {
		var _buff = undefined;
		var _parser = __LexiconGetParser(_file.ext);
		if (is_undefined(_parser)) {
			__LexiconTrace($"File \"{_file.filepath}\" doesn't have a valid parser type!");
			return;
		}
           
		try {
			_buff = __LexiconFindSharedBuffer(_file);
			if (is_undefined(_buff)) {
				_buff = buffer_load(_file.filepath);
			} else {
				_fileInSharedBuffer = true;
			}

			if (buffer_exists(_buff)) {
				_parser.parser(_buff, _file.filepath, _lang);	
				if (_file.hash == -1) {
					_file.hash = buffer_sha1(_buff, 0, buffer_get_size(_buff));
				}
			}
		} catch(_ex) {
			if (__LEXICON_ERROR_ON_LOAD_FAILURE_ON_RELEASE) && (GM_build_type == "exe")  {
				__LexiconError($"File \"{_file.filepath}\" failed to load.\n\n{_ex.longMessage}");
				return;
			}
			__LexiconTrace($"File \"{_file.filepath}\" failed to load with error.\n\n{_ex.longMessage}");
		} finally {
			if (buffer_exists(_buff)) {
				if (__LEXICON_USE_FILE_SHARED_BUFFERS) && (!_global.__languageLoaded) && (!_fileInSharedBuffer) {
					buffer_seek(_buff, buffer_seek_start, 0);
					array_push(_global.__sharedBuffers, {
						file: _file,
						buffer: _buff,
					});
				} else {
					buffer_delete(_buff);
				}
			}
		}
		return;
	}

	if (_file.isLoading) {
		if (__LEXICON_VERBOSE) {
			__LexiconTrace($"File \"{_file.filepath}\" already loading!");
		}
		
		if (__LEXICON_USE_FILE_SHARED_BUFFERS) {
			var _parser = __LexiconGetParser(_file.ext);
			if (is_undefined(_parser)) {
				__LexiconTrace($"File \"{_file.filepath}\" doesn't have a valid parser type!");
				return;
			}

			var _buff = __LEXICON_USE_FILE_SHARED_BUFFERS ? __LexiconFindSharedBuffer(_file) : undefined;
			if (!is_undefined(_buff)) {

				if (!instance_exists(__LexiconManager)) {
					instance_create_depth(0, 0, 0, __LexiconManager);
				}

				var _index = -1;
				with({_lang}) _index = array_find_index(__LexiconManager.filesList, function(_elm, _index) {
					return _elm == _lang;
				});

				if (_index == -1) {
					var _entry = {
						id: -1,
						buff: _buff,
						parser: _parser.parser,
						language: _lang,
						fileRef: _file,
						slot: ++_global.__asyncSlot,
					};
						
					array_push(__LexiconManager.filesList, {
						id: -1,
						cancelled: false,
						entry: _entry,
					});
				}
			}
		}

		return;
	}

	_file.isLoading = true;

	if (!instance_exists(__LexiconManager)) {
		instance_create_depth(0, 0, 0, __LexiconManager);
	}

	if (time_source_get_state(_ts) != time_source_state_active) {
		time_source_start(_ts);
	}

	var _parser = __LexiconGetParser(_file.ext);
	if (is_undefined(_parser)) {
		__LexiconTrace($"File \"{_file.filepath}\" doesn't have a valid parser type!");
		return;
	}
    
	buffer_async_group_begin("Lexicon");
	buffer_async_group_option("slottitle", "Language Files");
	buffer_async_group_option("subtitle", "");
	buffer_async_group_option("showdialog", false);
       
	var _entries = [];
	var _buff = buffer_create(1, buffer_grow, 1);
	var _entry = {
		id: buffer_load_async(_buff, _file.filepath, 0, -1),
		buff: _buff,
		parser: _parser.parser,
		language: _lang,
		fileRef: _file,
		slot: ++_global.__asyncSlot,
	};
		
	array_push(_list, {
		id: buffer_async_group_end(),
		cancelled: false,
		entry: _entry,
	});

	if (__LEXICON_USE_FILE_SHARED_BUFFERS) {
		array_push(_global.__sharedBuffers, {
			file: _file,
			buffer: _buff,
		});
	}
}