/// Feather ignore all
/// @ignore
function __UnicDatabaseCLDR() {
	static _inst = undefined;
	if (!is_undefined(_inst)) return _inst;

	var _compressedBuffer = buffer_load("unic_cldr.bin");
	var _buffer = buffer_decompress(_compressedBuffer);
	_inst = json_parse(buffer_read(_buffer, buffer_text));
	buffer_delete(_buffer);
	buffer_delete(_compressedBuffer);

	return _inst;
};
__UnicDatabaseCLDR();