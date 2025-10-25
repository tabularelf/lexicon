// Feather disable all

/// Returns the minus sign symbol for the locale. If the locale code is invalid this function will
/// return `-`.
/// 
/// @param [localeCode]

function UnicGetSymMinus(_localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return "-";
    
    return _database[$ _localeCode].symbols.minusSign;
}