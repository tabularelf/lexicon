/// Feather ignore all
/// @ignore

//Values derived from `__UnicUnicodeDataGenerateDatabase()`
#macro __UNIC_UNICODEDATA_INDEX_OFFSET    6
#macro __UNIC_UNICODEDATA_INDEX_DATATYPE  buffer_u16
#macro __UNIC_UNICODEDATA_DATA_STRIDE     14

function __UnicDatabaseUnicodeData()
{
	static _state = undefined;
	if (_state != undefined) return _state;
    
    _state = {};
    with(_state)
    {
    	var _compressedBuffer = buffer_load("unic_data.bin");
        __buffer = buffer_decompress(_compressedBuffer);
        buffer_delete(_compressedBuffer);
        
        var _version = buffer_read(__buffer, buffer_u16);
        if (_version != 0x01)
        {
            show_error("\"unic_data.bin\" header version failed", true);
        }
        
        var _glyphCount = buffer_read(__buffer, buffer_u32);
        if (_glyphCount != __UNIC_GLYPH_COUNT)
        {
            show_error("\"unic_data.bin\" glyph count failed", true);
        }
    }
    
	return _state;
}