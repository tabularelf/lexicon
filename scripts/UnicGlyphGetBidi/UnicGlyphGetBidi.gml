// Feather disable all

/// Returns the category code for a given Unicode codepoint. This will be a member of the
/// `UnicUnicodeDataBidi` enum (an integer).
/// 
/// @param codepoint

function UnicGlyphGetBidi(_codepoint)
{
    static _buffer = __UnicDatabaseUnicodeData().__buffer;
    
    var _index = buffer_peek(_buffer, __UNIC_UNICODEDATA_INDEX_OFFSET + clamp(buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*_codepoint, 0, __UNIC_MAX_GLYPH), buffer_u16);
    return buffer_peek(_buffer, __UNIC_UNICODEDATA_INDEX_OFFSET + buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*__UNIC_GLYPH_COUNT + __UNIC_UNICODEDATA_DATA_STRIDE*_index + 1, buffer_u8);
}