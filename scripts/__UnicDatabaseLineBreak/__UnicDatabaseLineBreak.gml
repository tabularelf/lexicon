/// Feather ignore all
/// @ignore

function __UnicDatabaseLineBreak()
{
	static _buffer = undefined;
	if (_buffer != undefined) return _buffer;

	_buffer = buffer_load("unic_linebreak.bin");

	return _buffer;
}