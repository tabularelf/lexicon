// Feather disable all

/// Converts a string to lowercase using Unicode mappings and returns it.
/// 
/// @param string

function UnicStringLower(_string)
{
    static _context = {
        __buffer: buffer_create(1024, buffer_grow, 1),
    };
    
    static _buffer = _context.__buffer;
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    
    string_foreach(_string, method(_context, function(_character, _position)
    {
        static _dataBuffer = __UnicDatabaseUnicodeData().__buffer;
        
        var _index = buffer_peek(_dataBuffer, __UNIC_UNICODEDATA_INDEX_OFFSET + clamp(buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*ord(_character), 0, __UNIC_MAX_GLYPH), buffer_u16);
        var _new = buffer_peek(_dataBuffer, __UNIC_UNICODEDATA_INDEX_OFFSET + buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*__UNIC_GLYPH_COUNT + __UNIC_UNICODEDATA_DATA_STRIDE*_index + 6, buffer_u32);
        
        buffer_write(__buffer, buffer_text, chr(_new));
    }
    ));
    
    buffer_write(_buffer, buffer_u8, 0x00);
    return buffer_peek(_buffer, 0, buffer_string);
}