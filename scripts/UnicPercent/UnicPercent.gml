// Feather disable all

/// Formats a number as a percentage using a localized format and localized symbols. For example,
/// an input of `100` will output `"100%"` in the US English locale.
/// 
/// @param number
/// @param [decimalPlaces=0]
/// @param [localeCode]

function UnicPercent(_number, _decimalPlaces = 0, _localeCode = undefined)
{
    static _system     = __UnicSystem();
    static _database   = __UnicDatabaseCLDR();
    static _nbsp       = chr(0xA0);
    static _nbspNarrow = chr(0x202F);
    
    _localeCode ??= _system.__locale;
    
    var _isNegative = (_number < 0);
    _number = abs(_number);
    
    var _percentSymbol = UnicGetSymPercent(_localeCode);
    
    var _format = _database[$ _localeCode].percentageFormat;
    if (_format == "#,##,##0%")
    {
        var _result = __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode) + _percentSymbol;
    }
    else if (_format == "#,##,##0 %") //nbsp
    {
        var _result = __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode) + _nbsp + _percentSymbol;
    }
    else if (_format == "#,##0%")
    {
        var _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _percentSymbol;
    }
    else if (_format == "#,##0 %") //nbsp
    {
        var _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbsp + _percentSymbol;
    }
    else if (_format == "#,##0 %") //Narrow nbsp
    {
        var _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbspNarrow + _percentSymbol;
    }
    else if (_format == "%#,##0")
    {
        var _result = _percentSymbol + __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "%#,#0")
    {
        var _result = _percentSymbol + __UnicFormatDecimalTokiPona(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "% #,##0") //nbsp
    {
        var _result = _percentSymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "% #,#0;% -#,#0") //Both nbsp
    {
        if (_isNegative < 0)
        {
            return _percentSymbol + _nbsp + __UnicFormatNegative(__UnicFormatDecimalTokiPona(_number, _decimalPlaces, _localeCode), _localeCode);
        }
        else
        {
            return _percentSymbol + __UnicFormatDecimalTokiPona(_number, _decimalPlaces, _localeCode);
        }
    }
    else
    {
        if (__UNIC_RUNNING_FROM_IDE)
        {
            __UnicError($"Percent format not supported \"{_format}\"");
        }
        
        var _result = __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode) + _percentSymbol;
    }
    
    return _isNegative? __UnicFormatNegative(_result, _localeCode) : _result;
}