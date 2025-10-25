// Feather disable all

/// Returns the linebreak type for a Unicode code point. This should be an integer, typically found
/// using `ord()` e.g. `UnicGlyphGetLineBreak(ord("?"))`.
/// 
/// @param codepoint

function UnicGlyphGetLineBreak(_codepoint)
{
    static _buffer = __UnicDatabaseLineBreak();
    return buffer_peek(_buffer, clamp(_codepoint, 0, __UNIC_MAX_GLYPH), buffer_u8);
}