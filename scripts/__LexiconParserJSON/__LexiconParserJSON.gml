// feather ignore all
/// @ignore
function __LexiconParserJSON(_buff, _file, _langEntry) {
	var _json = buffer_read(_buff, buffer_text);
	var _inst;
	_inst = json_parse(_json, function(_key, _value) {
		return _value;
	});

	if (is_array(_inst)) {
		for(var _i = array_length(_inst)-1; _i >=0; --_i) {
			if (__LexiconParserJSONStruct(_inst[_i], _file, _langEntry)) {
				return;
			}
		}
	} else {
		__LexiconParserJSONStruct(_inst, _file, _langEntry);
	}
}