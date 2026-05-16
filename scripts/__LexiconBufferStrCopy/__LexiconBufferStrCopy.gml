// feather ignore all 
/// @ignore
function __LexiconBufferStrCopy(_buff, _start, _end) {
	static _buffStrCopy = buffer_create(1024, buffer_grow, 1);
	if (_start > _end) return "";
	buffer_copy(_buff, _start, _end, _buffStrCopy, 0);
	buffer_poke(_buffStrCopy, _end-_start, buffer_u8, 0); // NULL byte
	buffer_seek(_buffStrCopy, buffer_seek_start, 0);
	return buffer_read(_buffStrCopy, buffer_text);
}