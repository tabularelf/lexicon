// Feather disable all

/// Returns the name of a month of the year. `monthIndex` should be an integer between 0 and 11
/// inclusive. If a number is provided outside of that range then the number will wrap around.
/// 
/// N.B. This function is normalized such that month index 0 is January and month index 11 is
///      December.
/// 
/// The `lengthFormat` parameter should be 0, 1, or 2. If you provide an integer outside of that
/// range then `lengthFormat` will be clamped to the valid range. This parameter changes what
/// length string is returned:
/// 
/// `0` = Narrow
///     Typically one character long. Months may be ambiguous e.g. June and July are both "J"
/// 
/// `1` = Abbreviated
///     Typically three to five characters in length.
/// 
/// `2` = Wide
///     Full name for the month of the year. Length varies.
/// 
/// @param monthIndex
/// @param [lengthFormat=2]
/// @param [localeCode]

function UnicGetMonthName(_monthIndex, _lengthFormat = 2, _localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return "???";
    
    _monthIndex = floor(_monthIndex);
    _lengthFormat = floor(_lengthFormat);
    
    if (_monthIndex < 0)
    {
        _monthIndex = 11 + ((_monthIndex + 1) mod 12);
    }
    else
    {
        _monthIndex = _monthIndex mod 12;
    }
    
    if (_lengthFormat <= 0)
    {
        return _database[$ _localeCode].monthsFormat.narrow[_monthIndex];
    }
    else if (_lengthFormat == 1)
    {
        return _database[$ _localeCode].monthsFormat.abbreviated[_monthIndex];
    }
    else if (_lengthFormat >= 2)
    {
        return _database[$ _localeCode].monthsFormat.wide[_monthIndex];
    }
}