// Feather disable all

/// Returns a formatted timestamp that contains hours, minutes, and (optionally) seconds. The
/// datetime number should be in the same format as the native GameMaker datetime number as
/// returned by functions like `date_current_datetime()`.
/// 
/// N.B. This function calls a few native functions which in turn depend on the current timezone.
///      Please read the GameMaker documentation on `date_set_timezone()` for more information.
/// 
/// @param datetime
/// @param [includeSeconds=false]
/// @param [localeCode]

function UnicClock(_datetime, _includeSeconds = false, _localeCode = undefined)
{
    return UnicClockExt(date_get_hour(_datetime),
                        date_get_minute(_datetime),
                        _includeSeconds? date_get_second(_datetime) : undefined,
                        _localeCode);
}