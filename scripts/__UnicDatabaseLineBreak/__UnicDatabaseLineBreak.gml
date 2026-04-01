/// Feather ignore all
/// @ignore

function __UnicDatabaseLineBreak()
{
	static _buffer = undefined;
	if (_buffer != undefined) return _buffer;

	var _compressedBuffer = buffer_load("unic_linebreak.bin");
	_buffer = buffer_decompress(_compressedBuffer);
	buffer_delete(_compressedBuffer);

	return _buffer;
}