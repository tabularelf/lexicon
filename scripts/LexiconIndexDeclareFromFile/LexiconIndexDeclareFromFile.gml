// feather ignore all
function LexiconIndexDeclareFromFile(_file) {
	static _parsers = __LexiconSystem().__parsers;

	LexiconPlugInForceLoad();

	var _ext = string_lower(string_delete(filename_ext(_file), 1, 1));
	var _parser = _parsers[$ _ext];
	if (is_undefined(_parser) || (is_struct(_parser) && !is_callable(_parser.declare))) {
		__LexiconTrace($"Cannot declare from file \"{_file}\", parser doesn't exist for \"{_ext}\"!'");
		return;
	}

	try {
		var _buff = buffer_load(_file);
		if (!buffer_exists(_buff)) {
			__LexiconTrace($"Failed to load file \"{_file}\" for declaring.");
			return;
		}

		_parser.declare(_buff, _file);
	} finally {
		buffer_delete(_buff);
	}
}