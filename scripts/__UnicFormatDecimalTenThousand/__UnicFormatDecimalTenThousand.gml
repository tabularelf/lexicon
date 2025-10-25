// Feather disable all

/// TODO - Hook up to Chinese and Japanese locales
/// 
/// #,###0.###

function __UnicFormatDecimalTenThousand(_number, _decimalPlaces, _localeCode)
{
    static _system = __UnicSystem();
    static _nbsp = chr(0xA0);
    
    _localeCode ??= _system.__locale;
    
    var _isNegative = (_number < 0);
    _number = abs(_number);
    
    var _numberString = string_format(_number, 0, _decimalPlaces);
    var _wholeLength = string_length(_numberString);
    
    if (_isNegative) _wholeLength--;
    
    if (_decimalPlaces <= 0)
    {
        if (_wholeLength <= 4)
        {
            return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
        }
    }
    else
    {
        var _decimalSymbol = UnicGetSymDecimal(_localeCode);
        var _decimalPointLength = string_length(_decimalSymbol);
        _numberString = string_replace(_numberString, ".", _decimalSymbol);
        
        if (_wholeLength <= 4 + _decimalPointLength + _decimalPlaces)
        {
            return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
        }
        
        _wholeLength -= _decimalPlaces + _decimalPointLength;
    }
    
    var _groupSymbol = UnicGetSymThousands(_localeCode);
    
    var _workingPos = _wholeLength-3;
    repeat(ceil(_wholeLength / 4) - 1)
    {
        _numberString = string_insert(_groupSymbol, _numberString, _workingPos);
        _workingPos -= 4;
    }
    
    return _isNegative? __UnicFormatNegative(_numberString, _localeCode) : _numberString;
}