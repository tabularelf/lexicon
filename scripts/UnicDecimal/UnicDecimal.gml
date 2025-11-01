// Feather disable all

/// Formats a number as a decimal using a localized format and localized symbols. The fractional
/// part is rounded to the nearest whole decimal. For example, an input of `0.4269` using 3 decimal
/// places will output `"0.427"`.
/// 
/// @param number
/// @param [decimalPlaces=default]
/// @param [localeCode]

function UnicDecimal(_number, _decimalPlaces = UNIC_DEFAULT_DECIMAL_PLACES, _localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    var _format = _database[$ _localeCode].decimalFormat;
    
    if (_format == "#,##0.###")
    {
        return __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "#,##,##0.###")
    {
        return __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "#,#0.###")
    {
        return __UnicFormatDecimalTokiPona(_number, _decimalPlaces, _localeCode);
    }
    else
    {
        if (__UNIC_RUNNING_FROM_IDE)
        {
            __UnicError($"Decimal format not supported \"{_format}\"");
        }
        
        return __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
}