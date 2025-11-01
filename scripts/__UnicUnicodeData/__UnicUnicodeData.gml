// https://www.unicode.org/reports/tr44/#General_Category_Values

enum UnicUnicodeDataCategory
{
    INVALID = 0x00,
    
    UPPERCASE_LETTER = 0x11, //Lu
    LOWERCASE_LETTER = 0x12, //Ll
    TITLECASE_LETTER = 0x13, //Lt
    MODIFIER_LETTER  = 0x14, //Lm
    OTHER_LETTER     = 0x15, //Lo
    
    NONSPACING_MARK = 0x21, //Mn
    SPACING_MARK    = 0x22, //Mc
    ENCLOSING_MARK  = 0x23, //Me
    
    DECIMAL_NUMBER = 0x31, //Nd
    LETTER_NUMBER  = 0x32, //Nl
    OTHER_NUMBER   = 0x33, //No
    
    CONNECTOR_PUNCTUATION = 0x41, //Pc
    DASH_PUNCTUATION      = 0x42, //Pd
    OPEN_PUNCTUATION      = 0x43, //Ps
    CLOSE_PUNCTUATION     = 0x44, //Pe
    INITIAL_PUNCTUATION   = 0x45, //Pi
    FINAL_PUNCTUATION     = 0x46, //Pf
    OTHER_PUNCTUATION     = 0x47, //Po
    
    MATH_SYMBOL     = 0x51, //Sm
    CURRENCY_SYMBOL = 0x52, //Sc
    MODIFIER_SYMBOL = 0x53, //Sk
    OTHER_SYMBOL    = 0x54, //So
    
    SPACE_SEPARATOR     = 0x61, //Zs
    LINE_SEPARATOR      = 0x62, //Zl
    PARAGRAPH_SEPARATOR = 0x63, //Zp
    
    CONTROL     = 0x71, //Cc
    FORMAT      = 0x72, //Cf
    SURROGATE   = 0x73, //Cs
    PRIVATE_USE = 0x74, //Co
    UNASSIGNED  = 0x75, //Cn
}

// https://www.unicode.org/reports/tr44/#Bidi_Class_Values

enum UnicUnicodeDataBidi
{
    INVALID = 0x00,
    
    LEFT_TO_RIGHT = 0x11, //L
    RIGHT_TO_LEFT = 0x12, //R
    ARABIC_LETTER = 0x13, //AL
    
    EUROPEAN_NUMBER     = 0x21, //EN
    EUROPEAN_SEPARATOR  = 0x22, //ES
    EUROPEAN_TERMINATOR = 0x23, //ET
    ARABIC_NUMBER       = 0x24, //AN
    COMMON_SEPARATOR    = 0x25, //CS
    NONSPACING_MARK     = 0x26, //NSM
    BOUNDARY_NEUTRAL    = 0x27, //BN
    
    PARAGRAPH_SEPARATOR = 0x31, //B
    SEGMENT_SEPARATOR   = 0x32, //S
    WHITE_SPACE         = 0x33, //WS
    OTHER_NEUTRAL       = 0x34, //ON
    
    LEFT_TO_RIGHT_EMBEDDING = 0x41, //LRE
    LEFT_TO_RIGHT_OVERRIDE  = 0x42, //LRO
    RIGHT_TO_LEFT_EMBEDDING = 0x43, //RLE
    RIGHT_TO_LEFT_OVERRIDE  = 0x44, //RLO
    POP_DIRECTIONAL_FORMAT  = 0x45, //PDF
    LEFT_TO_RIGHT_ISOLATE   = 0x46, //LRI
    RIGHT_TO_LEFT_ISOLATE   = 0x47, //RLI
    FIRST_STRONG_ISOLATE    = 0x48, //FSI
    POP_DIRECTIONAL_ISOLATE = 0x49, //PDI
}