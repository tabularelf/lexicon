// Feather disable all

/// @param string
/// @param localeCode

function __UnicFormatNegative(_string, _localeCode)
{
    return UnicGetSymMinus(_localeCode) + _string;
}