// feather ignore all
/// @param {String} filepath
function LexiconIndexDeclareFromFile(_file) {
	LexiconPlugInForceLoad();

	var _ext = string_lower(string_delete(filename_ext(_file), 1, 1));
	var _parser = __LexiconGetParser(_ext)
	if (is_undefined(_parser) || (is_struct(_parser) && !is_callable(_parser.declare))) {
		__LexiconTrace($"Cannot declare from file \"{_file}\", parser doesn't exist for \"{_ext}\"!'");
		return;
	}

	try {
		var _buff = buffer_load(_file);
		if (!buffer_exists(_buff)) {
			if (__LEXICON_ERROR_ON_INDEX_FILE_ADD) __LexiconError($"Failed to load file \"{_file}\" for declaring. File missing.");
			return;
		}

		_parser.declare(_buff, _file);
	} finally {
		if (buffer_exists(_buff)) buffer_delete(_buff);
	}
}