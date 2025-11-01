// Feather disable all

/// Returns a formatted datestamp that contains the year, month, day, hours, minutes, and
/// (optionally) seconds. The datetime number should be in the same format as the native GameMaker
/// datetime number as returned by functions like `date_current_datetime()`.
/// 
/// N.B. This function calls a few native functions which in turn depend on the current timezone.
///      Please read the GameMaker documentation on `date_set_timezone()` for more information.
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
/// @param datetime
/// @param [lengthFormat=1]
/// @param [includeSeconds=false]
/// @param [localeCode]

function UnicDateTime(_datetime, _lengthFormat = 1, _includeSeconds = false, _localeCode = undefined)
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
    
    return string(_format, UnicClock(_datetime, _includeSeconds, _localeCode), UnicDate(_datetime, _lengthFormat, _localeCode));
}