// Feather disable all

/// Returns a formatted datestamp that contains the year, month, day, hours, minutes, and
/// (optionally) seconds.
/// 
/// The year must be an integer greater than or equal to `0`. The month must be an integer between
/// `1` and `12`. The day must be an integer between `1` and the number of days in the month
/// (including respecting short/long februaries due to leap years). Integers outside of these
/// ranges will be clamped.
/// 
/// The number of hours should be an integer from 0 to 23 inclusive. The number of minutes and
/// seconds should be an integer from 0 to 59 inclusive. Integers outside of these ranges will be
/// clamped. If you do not wish to include seconds in the output, pass `undefined` for the
/// `seconds` argument.
/// 
/// The `lengthFormat` parameter should be 0, 1, 2, or 3. If you provide an integer outside of that
/// range then `lengthFormat` will be clamped to the valid range. This parameter changes what
/// length string is returned:
/// 
/// `0` = Short
///     Shortest date. Month name is a number or heavily abbreviated.
/// 
/// `1` = Medium
///     Somewhat abbreviated date. Month name is shortened.
/// 
/// `2` = Long
///     Full date. Month name is written out in full.
/// 
/// `3` = Full
///     Full date, typically also including the name of the day of the week.
/// 
/// https://st.unicode.org/cldr-apps/v#/fr/Gregorian/7a365a21694f0127
/// 
/// @param year
/// @param month
/// @param day
/// @param hours
/// @param minutes
/// @param [seconds]
/// @param [lengthFormat=1]
/// @param [localeCode]

function UnicDateTimeExt(_year, _month, _day, _hours, _minutes, _seconds = undefined, _lengthFormat = 1, _localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (_lengthFormat <= 0)
    {
        var _format = _database[$ _localeCode].dateTimeFormat.short;
    }
    else if (_lengthFormat == 1)
    {
        var _format = _database[$ _localeCode].dateTimeFormat.medium;
    }
    else if (_lengthFormat == 2)
    {
        var _format = _database[$ _localeCode].dateTimeFormat.long;
    }
    else if (_lengthFormat >= 3)
    {
        var _format = _database[$ _localeCode].dateTimeFormat.full;
    }
    
    return string(_format, UnicClockExt(_hours, _minutes, _seconds, _localeCode), UnicDateExt(_year, _month, _day, _lengthFormat, _localeCode));
}