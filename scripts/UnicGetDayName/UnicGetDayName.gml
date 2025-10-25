// Feather disable all

/// Returns the name of the day of the week. `dayIndex` should be an integer between 0 and 6
/// inclusive. If a number is provided outside of that range then the number will wrap around.
/// 
/// N.B. This function is normalized such that day index 0 is Monday and day index 6 is Sunday.
/// 
/// The `lengthFormat` parameter should be 0, 1, 2, or 3. If you provide an integer outside of that
/// range then `lengthFormat` will be clamped to the valid range. This parameter changes what
/// length string is returned:
/// 
/// `0` = Narrow
///     Typically one character long. Days may be ambiguous e.g. Tuesday and Thursday are both "T"
/// 
/// `1` = Short
///     Typically two or three characters in length.
/// 
/// `2` = Abbreviated
///     Often the same as "Short" but, if not, around three to five characters in length.
/// 
/// `3` = Wide
///     Full name for the day of the week. Length varies.
/// 
/// @param dayIndex
/// @param [lengthFormat=3]
/// @param [localeCode]

function UnicGetDayName(_dayIndex, _lengthFormat = 3, _localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return "???";
    
    _dayIndex = floor(_dayIndex);
    _lengthFormat = floor(_lengthFormat);
    
    if (_dayIndex < 0)
    {
        _dayIndex = 6 + ((_dayIndex + 1) mod 7);
    }
    else
    {
        _dayIndex = _dayIndex mod 7;
    }
    
    if (_lengthFormat <= 0)
    {
        return _database[$ _localeCode].daysFormat.narrow[_dayIndex];
    }
    else if (_lengthFormat == 1)
    {
        return _database[$ _localeCode].daysFormat.short[_dayIndex];
    }
    else if (_lengthFormat == 2)
    {
        return _database[$ _localeCode].daysFormat.abbreviated[_dayIndex];
    }
    else if (_lengthFormat >= 3)
    {
        return _database[$ _localeCode].daysFormat.wide[_dayIndex];
    }
}