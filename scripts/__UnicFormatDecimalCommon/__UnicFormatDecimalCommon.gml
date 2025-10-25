// Feather disable all

/// #,##0.###

function __UnicFormatDecimalCommon(_number, _decimalPlaces, _localeCode)
{
    static _system = __UnicSystem();
    static _tenThousandDict = {
        "ja": true,
        "zh": true,
        "zh_Hans": true,
        "zh_Hans_HK": true,
        "zh_Hans_MO": true,
        "zh_Hans_MY": true,
        "zh_Hans_SG": true,
        "zh_Hant": true,
        "zh_Hant_HK": true,
        "zh_Hant_MO": true,
        "zh_Hant_MY": true,
        //"zh_Latn": false, //Don't use ten thousand units for Latin
    }
    
    _localeCode ??= _system.__locale;
    
    //Try to remap to ten thousands if we're using the alternate number format
    if (_system.__altNumberFormat && struct_exists(_tenThousandDict, _localeCode))
    {
        return __UnicFormatDecimalTenThousand(_number, _decimalPlaces, _localeCode);
    }
    
    var _isNegative = (_number < 0);
    _number = abs(_number);
    
    var _numberString = string_format(_number, 0, _decimalPlaces);
    var _wholeLength = string_length(_numberString);
    
    if (_isNegative) _wholeLength--;
    
    if (_decimalPlaces <= 0)
    {
        if (_wholeLength <= 3)
        {
            return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
        }
    }
    else
    {
        var _decimalSymbol = UnicGetSymDecimal(_localeCode);
        var _decimalPointLength = string_length(_decimalSymbol);
        _numberString = string_replace(_numberString, ".", _decimalSymbol);
        
        if (_wholeLength <= 3 + _decimalPointLength + _decimalPlaces)
        {
            return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
        }
        
        _wholeLength -= _decimalPlaces + _decimalPointLength;
    }
    
    var _groupSymbol = UnicGetSymThousands(_localeCode);
    
    var _workingPos = _wholeLength-2;
    repeat(ceil(_wholeLength / 3) - 1)
    {
        _numberString = string_insert(_groupSymbol, _numberString, _workingPos);
        _workingPos -= 3;
    }
    
    return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
}