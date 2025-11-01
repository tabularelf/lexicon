// Feather disable all

/// Returns the current global locale set by `UnicSetLocale()`.

function UnicGetLocale()
{
    static _system = __UnicSystem();
    
    return _system.__locale;
}