// Feather disable all

/// Returns the percentage sign symbol for the locale. If the locale code is invalid this function
/// will return `%`.
/// 
/// @param [localeCode]

function UnicGetSymPercent(_localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return "%";
    
    return _database[$ _localeCode].symbols.percentSign;
}