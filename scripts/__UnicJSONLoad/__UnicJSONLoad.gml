/// Feather ignore all
/// @ignore
function __UnicJSONLoad(_filepath) {
	var _buff;
	try {
		_buff = buffer_load(_filepath);
		var _json = buffer_read(_buff, buffer_text);
		return json_parse(_json);
	} catch(_ex) {
		__UnicError($"File \"{_filepath}\" failed to load. ${_ex.message}");
		return;
	} finally {
		if (buffer_exists(_buff)) {
			buffer_delete(_buff);
		}
	}
}