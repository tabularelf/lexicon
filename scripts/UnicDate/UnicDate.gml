// Feather disable all

/// Returns a formatted datestamp that contains the year, month, and day. The datetime number
/// should be in the same format as the native GameMaker datetime number as returned by functions
/// like `date_current_datetime()`.
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
/// @param [localeCode]

function UnicDate(_datetime, _lengthFormat = 1, _localeCode = undefined)
{
    return UnicDateExt(date_get_year(_datetime), date_get_month(_datetime), date_get_day(_datetime), _lengthFormat, _localeCode);
}