if (array_length(__LexiconFileAsyncList()) == 0) {
	if (!hasSorted) {
		hasSorted = true;
		array_sort(filesList, function(_a, _b) {
			return sign(_a.entry.slot - _b.entry.slot);
		});
	}

	var _maxTime = get_timer() + __LEXICON_ASYNC_LOAD_PER_FILE_TIME_MS;

	while(get_timer() < _maxTime) {
		var _file = array_shift(filesList);
		if (is_undefined(_file)) {
			__LexiconManagerCleanUp();
			return;
		}

		try {
			if (!_file.cancelled) {
				_file.entry.parser(_file.entry.buff, _file.entry.fileRef.filepath, _file.entry.language);
				if (_file.entry.fileRef.hash == -1) {
					_file.entry.fileRef.hash = buffer_sha1(_file.entry.buff, 0, buffer_get_size(_file.entry.buff));
				}
				_file.entry.language.__loaded = true;
			}
		} catch(_ex) {
			if (__LEXICON_ERROR_ON_LOAD_FAILURE_ON_RELEASE) && (GM_build_type == "exe") {
				__LexiconError($"File \"{_file.entry.fileRef.filepath}\" failed to load.\n\n{_ex.longMessage}");
				return;
			}
			__LexiconTrace($"File \"{_file.entry.fileRef.filepath}\" failed to load.\n\n{_ex.longMessage}");
		} finally {
			buffer_seek(_file.entry.buff, buffer_seek_start, 0);
			_file.entry.fileRef.isLoading = false;
			if (!__LEXICON_USE_FILE_SHARED_BUFFERS) buffer_delete(_file.entry.buff);
		}
	}
}