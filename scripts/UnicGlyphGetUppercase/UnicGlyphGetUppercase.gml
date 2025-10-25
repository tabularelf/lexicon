// Feather disable all

/// Returns the Unicode codepoint that is the uppercase variant of the given codepoint. For many
/// codepoints, there is no canonical uppercase counterpart. This function will return the input
/// codepoint if no uppercase equivalent can be found.
/// 
/// @param codepoint

function UnicGlyphGetUppercase(_codepoint)
{
    static _buffer = __UnicDatabaseUnicodeData().__buffer;
    
    var _index = buffer_peek(_buffer, __UNIC_UNICODEDATA_INDEX_OFFSET + clamp(buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*_codepoint, 0, __UNIC_MAX_GLYPH), buffer_u16);
    return buffer_peek(_buffer, __UNIC_UNICODEDATA_INDEX_OFFSET + buffer_sizeof(__UNIC_UNICODEDATA_INDEX_DATATYPE)*__UNIC_GLYPH_COUNT + __UNIC_UNICODEDATA_DATA_STRIDE*_index + 2, buffer_u32);
}