// feather ignore all
/// @ignore
function __LexiconBufferClone(_srcBuffer, _offset = 0, _size = buffer_get_size(_srcBuffer)) {
	var _destBuffer = buffer_create(_size-_offset, buffer_grow, 1);
	buffer_copy(_srcBuffer, _offset, _size, _destBuffer, 0);
	return _destBuffer;
}