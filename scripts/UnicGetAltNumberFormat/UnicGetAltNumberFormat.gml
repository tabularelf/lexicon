// Feather disable all

/// Returns whether alternate number formats are being used.

function UnicGetAltNumberFormat()
{
    static _system = __UnicSystem();
    
    return _system.__altNumberFormat;
}