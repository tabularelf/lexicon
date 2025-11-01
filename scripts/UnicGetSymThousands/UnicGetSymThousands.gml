// Feather disable all

/// Returns the thousnads separator symbol for the locale. This is more properly called the
/// "grouping separator" but we use the term accepted for Arabic numerals for convenience. If the
/// locale code is invalid this function will return `,`.
/// 
/// @param [localeCode]

function UnicGetSymThousands(_localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return ",";
    
    return _database[$ _localeCode].symbols.group;
}