// Feather disable all

/// Returns a string that contains the formatted date/time as per `https://hammertime.cyou/en`.
/// The input string should be something like `"<t:1763816220:d>"` where the decimal string is the
/// time since the Unix epoch (1st January 1970) and the suffix is the format to use. The following
/// formats are supported:
/// 
/// `"<t:1763816220:d>"` = `"22/11/2025"`
/// `"<t:1763816220:D>"` = `"22 November 2025"`
/// `"<t:1763816220:t>"` = `"12:57 PM"`
/// `"<t:1763816220:T>"` = `"12:57:00 PM"`
/// `"<t:1763816220:f>"` = `"22 November 2025, 12:57 PM"`
/// `"<t:1763816220:F>"` = `"Saturday, 22 November 2025, 12:57 PM"`
/// `"<t:1763816220:s>"` = `"22/11/2025, 12:57 PM"`
/// `"<t:1763816220:S>"` = `"22/11/2025. 12:57:00 PM"`
/// 
/// The `:R` relative time format is not supported. If the input string fails to be parsed then
/// this function will return the value of the `fallback` parameter which defaults to an empty
/// string.
/// 
/// @param timestampString
/// @param [fallback=""]
/// @param [localeCode]

function UnicConvertTimestamp(_inTimestampString, _fallback = "", _localeCode)
{
    var _timestampString = _inTimestampString;
    
    var _stringLength = string_length(_timestampString);
    if (string_char_at(_timestampString, 1) == "<")
    {
        if (string_char_at(_timestampString, _stringLength) != ">")
        {
            //__UnicError($"Failed to parse \"{_inTimestampString}\"\nFound \"<\" but no matching \">\"");
            return _fallback;
        }
        
        _timestampString = string_copy(_timestampString, 2, _stringLength-2);
        _stringLength -= 2;
    }
    
    if (string_copy(_timestampString, 1, 2) != "t:")
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nCould not find \"t:\" prefix");
        return _fallback;
    }
    
    _timestampString = string_delete(_timestampString, 1, 2);
    _stringLength -= 2;
    
    var _colonCount = string_count(":", _timestampString);
    if (_colonCount <= 0)
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nCould not find \":\"");
        return _fallback;
    }
    
    if (_colonCount > 1)
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nMultiple \":\" found");
        return _fallback;
    }
    
    if (string_char_at(_timestampString, _stringLength-1) != ":")
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\n\":\" in unexpected position");
        return _fallback;
    }
    
    var _timeString = string_copy(_timestampString, 1, _stringLength-2);
    var _modeChar   = string_char_at(_timestampString, _stringLength);
    
    if (string_digits(_timeString) != _timeString)
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nNumber portion contains non-numeric characters");
        return _fallback;
    }
    
    try
    {
        var _unixTime = real(_timeString);
    }
    catch(_error)
    {
        //show_debug_message(_error);
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nFailed to convert number portion");
        return _fallback;
    }
    
    var _dateTime = date_create_datetime(1970, 1, 1, 0, 0, _unixTime);
    
    if (_modeChar == "d")
    {
        return UnicDate(_dateTime, 0, _localeCode);
    }
    else if (_modeChar == "D")
    {
        return UnicDate(_dateTime, 2, _localeCode);
    }
    else if (_modeChar == "t")
    {
        return UnicClock(_dateTime, false, _localeCode);
    }
    else if (_modeChar == "T")
    {
        return UnicClock(_dateTime, true, _localeCode);
    }
    else if (_modeChar == "f")
    {
        return UnicDateTime(_dateTime, 2, false, _localeCode);
    }
    else if (_modeChar == "F")
    {
        return UnicDateTime(_dateTime, 3, false, _localeCode);
    }
    else if (_modeChar == "s")
    {
        return UnicDateTime(_dateTime, 0, false, _localeCode);
    }
    else if (_modeChar == "S")
    {
        return UnicDateTime(_dateTime, 0, true, _localeCode);
    }
    else
    {
        //__UnicError($"Failed to parse \"{_inTimestampString}\"\nMode \"{_modeChar}\" is not supported");
        return _fallback;
    }
}