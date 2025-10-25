// Feather disable all

/// Sets the current locale code for Unic. This locale code will be used when a locale code is not
/// otherwise specified when calling a Unic function.
/// 
/// @param localeCode

function UnicSetLocale(_localeCode)
{
    static _system = __UnicSystem();
    
    _system.__locale = _localeCode;
}