/// @ignore
/// feather ignore all
function __buffer_read_utf8(_buffer){
	var _value = buffer_read(_buffer, buffer_u8);
	if ((_value & 0xE0) == 0xC0) { //two-byte
	    _value  = (_value & 0x1F) <<  6;
	    _value += (buffer_read(_buffer, buffer_u8) & 0x3F);
	} else if ((_value & 0xF0) == 0xE0) { //three-byte
	    _value  = ( _value & 0x0F) << 12;
	    _value += (buffer_read(_buffer, buffer_u8) & 0x3F) <<  6;
	    _value +=  buffer_read(_buffer, buffer_u8) & 0x3F;
	} else if ((_value & 0xF8) == 0xF0)  { //four-byte
	    _value  = (_value & 0x07) << 18;
	    _value += (buffer_read(_buffer, buffer_u8) & 0x3F) << 12;
	    _value += (buffer_read(_buffer, buffer_u8) & 0x3F) <<  6;
	    _value +=  buffer_read(_buffer, buffer_u8) & 0x3F;
	}
	
	return _value;
}
