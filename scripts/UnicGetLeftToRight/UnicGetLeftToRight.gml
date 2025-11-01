// Feather disable all

/// Returns whether text in the given locale is written from left to right. If the locale doesn't
/// exist, this function will return `true`.
/// 
/// @param [localeCode]

function UnicGetLeftToRight(_localeCode)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return false;
    
    return _database[$ _localeCode].layout.leftToRight;
}