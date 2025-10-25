// Feather disable all

/// Formats a number as an integer using a localized format and localized symbols. The fractional
/// part is rounded to the nearest whole number. For example, an input of `42000.69` will output
/// `"42,001"` in the US English locale.
/// 
/// @param number
/// @param [localeCode]

function UnicInteger(_number, _localeCode = undefined)
{
    return UnicDecimal(_number, 0, _localeCode);
}