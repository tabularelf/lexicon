// Feather disable all

/// Formats a number in the local currency using a localized format. You will need to provide the
/// currency symbol yourself ($ £ € ¥ etc.) as a string. The fractional part will be rounded to the
/// nearest decimal, as per `UnicDecimal()`.
/// 
/// @param currencySymbol
/// @param number
/// @param [decimalPlaces=2]
/// @param [localeCode]

function UnicCurrency(_currencySymbol, _number, _decimalPlaces = 2, _localeCode = undefined)
{
    static _system     = __UnicSystem();
    static _database   = __UnicDatabaseCLDR();
    static _nbsp       = chr(0xA0);
    static _nbspNarrow = chr(0x202F);
    
    _localeCode ??= _system.__locale;
    
    var _isNegative = (_number < 0);
    _number = abs(_number);
    
    var _format = _database[$ _localeCode].currencyFormat;
    if (_format == "#,##,##0.00¤")
    {
        _result = __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode) + _currencySymbol;
    }
    else if (_format == "#,##0.00 ¤") //nbsp
    {
        _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbsp + _currencySymbol;
    }
    else if (_format == "#,##0.00 ¤;-#,##0.00 ¤") //Both nbsp
    {
        if (_isNegative)
        {
            return __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode) + _nbsp + _currencySymbol;
        }
        else
        {
            return __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbsp + _currencySymbol;
        }
    }
    else if (_format == "#,##0.00¤")
    {
        _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _currencySymbol;
    }
    else if (_format == "#,##0.00 ¤") //Narrow nbsp
    {
        _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbspNarrow + _currencySymbol;
    }
    else if (_format == "¤#,##,##0.00")
    {
        _result = _currencySymbol + __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "¤#,##0.00")
    {
        _result = _currencySymbol + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "¤#,##0.00;¤-#,##0.00")
    {
        if (_isNegative)
        {
            return _currencySymbol + __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode);
        }
        else
        {
            return _currencySymbol + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
        }
    }
    else if (_format == "¤#,##0.00;¤- #,##0.00") //nbsp
    {
        if (_isNegative)
        {
            return _currencySymbol + __UnicFormatNegative(_nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode);
        }
        else
        {
            return _currencySymbol + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
        }
    }
    else if (_format == "¤#,#0.00")
    {
        _result = _currencySymbol + __UnicFormatDecimalTokiPona(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "¤ #,##,##0.00") //nbsp
    {
        _result = _currencySymbol + _nbsp + __UnicFormatDecimalHindi(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "¤ #,##0.00") //nbsp
    {
        _result = _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "¤ #,##0.00;¤-#,##0.00") //nbsp
    {
        if (_isNegative)
        {
            return _currencySymbol + __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode);
        }
        else
        {
            return _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
        }
    }
    else if (_format == "¤ #,##0.00;¤ #,##0.00-") //Both nbsp
    {
        if (_isNegative)
        {
            return _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + __UnicFormatNegative("", _localeCode);
        }
        else
        {
            return _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
        }
    }
    else if (_format == "¤ #,##0.00;¤ -#,##0.00") //Both nbsp
    {
        if (_isNegative)
        {
            return _currencySymbol + _nbsp + __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode);
        }
        else
        {
            return _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
        }
    }
    else if (_format == "¤ #,##0.00") //nbsp
    {
        _result = _currencySymbol + _nbsp + __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    else if (_format == "#,##0.00 ¤;‏-#,##0.00 ¤") //nbsp. Uses bidi direction mark
    {
        if (_isNegative)
        {
            return "‏" + __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode) + _nbsp + _currencySymbol;
        }
        else
        {
            return __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbsp + _currencySymbol;
        }
    }
    else if (_format == "#,##0.00 ‏¤;‏-#,##0.00 ‏¤") //Both nbsp. Uses bidi direction marks
    {
        if (_isNegative)
        {
            return "‏" + __UnicFormatNegative(__UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode), _localeCode) + _nbsp + "‏" + _currencySymbol;
        }
        else
        {
            return __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode) + _nbsp + "‏" + _currencySymbol;
        }
    }
    else
    {
        if (__UNIC_RUNNING_FROM_IDE)
        {
            __UnicError($"Decimal format not supported \"{_format}\"");
        }
        
        var _result = __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode);
    }
    
    return _isNegative? __UnicFormatNegative(_result, _localeCode) : _result;
}