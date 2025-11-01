// Feather disable all

/// Returns a formatted timestamp that contains hours, minutes, and seconds. The number of hours
/// should be an integer from 0 to 23 inclusive. The number of minutes and seconds should be an
/// integer from 0 to 59 inclusive. Integers outside of these ranges will be clamped. If you do
/// not wish to include seconds in the output, pass `undefined` for the `seconds` argument.
/// 
/// https://cldr.unicode.org/translation/date-time/date-time-patterns
/// https://st.unicode.org/cldr-apps/v#/fr/Gregorian/7a365a21694f0127
/// 
/// @param hours
/// @param minutes
/// @param [seconds]
/// @param [localeCode]

function UnicClockExt(_hours, _minutes, _seconds = undefined, _localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    static _buffer   = buffer_create(1024, buffer_grow, 1);
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    
    _localeCode ??= _system.__locale;
    
    //Handle seconds straight away
    if (_seconds == undefined)
    {
        var _format = _database[$ _localeCode].timeFormat.short;
    }
    else
    {
        var _format = _database[$ _localeCode].timeFormat.medium;
    }
    
    _hours   = clamp(floor(_hours), 0, 23);
    _minutes = clamp(floor(_minutes), 0, 59);
    _seconds = clamp(floor(_seconds ?? 0), 0, 59);
    
    var _inString = false;
    var _formatLength = string_length(_format);
    var _formatPos = 1;
    while(_formatPos <= _formatLength)
    {
        var _char = string_char_at(_format, _formatPos);
        if (_char == "'")
        {
            if (string_char_at(_format, _formatPos+1) == "'")
            {
                buffer_write(_buffer, buffer_text, "'");
                ++_formatPos;
            }
            else
            {
                _inString = not _inString;
            }
        }
        else if (_inString)
        {
            buffer_write(_buffer, buffer_text, _char);
        }
        else
        {
            if (_char == "H")
            {
                if (string_char_at(_format, _formatPos+1) == "H")
                {
                    buffer_write(_buffer, buffer_text, (_hours < 10)? ("0" + string(_hours)) : string(_hours));
                    ++_formatPos;
                }
                else
                {
                    buffer_write(_buffer, buffer_text, string(_hours));
                }
            }
            else if (_char == "h")
            {
                if (string_char_at(_format, _formatPos+1) == "h")
                {
                    buffer_write(_buffer, buffer_text, string((_hours >= 13)? (_hours - 12) : _hours));
                    ++_formatPos;
                }
                else
                {
                    var _hours12 = (_hours >= 13)? (_hours - 12) : _hours;
                    buffer_write(_buffer, buffer_text, (_hours12 < 10)? ("0" + string(_hours12)) : string(_hours12));
                }
            }
            else if (_char == "K")
            {
                //TODO
                //12-hour clock between 0 and 11
            }
            else if (_char == "k")
            {
                //TODO
                //24-hour clock between 1 and 24
            }
            else if (_char == "m")
            {
                if (string_char_at(_format, _formatPos+1) == "m")
                {
                    buffer_write(_buffer, buffer_text, (_minutes < 10)? ("0" + string(_minutes)) : string(_minutes));
                    ++_formatPos;
                }
                else
                {
                    if (__UNIC_RUNNING_FROM_IDE)
                    {
                        __UnicError($"Time format for locale \"{_localeCode}\" malformed (minutes)");
                    }
                }
            }
            else if (_char == "s")
            {
                if (string_char_at(_format, _formatPos+1) == "s")
                {
                    buffer_write(_buffer, buffer_text, (_seconds < 10)? ("0" + string(_seconds)) : string(_seconds));
                    ++_formatPos;
                }
                else
                {
                    if (__UNIC_RUNNING_FROM_IDE)
                    {
                        __UnicError($"Time format for locale \"{_localeCode}\" malformed (seconds)");
                    }
                }
            }
            else if (_char == "a")
            {
                buffer_write(_buffer, buffer_text, (_hours >= 12)? "PM" : "AM");
            }
            else if (_char == "b") //Time of day phrase, standalone version
            {
                //TODO
                //https://www.unicode.org/cldr/charts/45/supplemental/day_periods.html
                
                //am
                //noon
                //pm
                //midnight
                buffer_write(_buffer, buffer_text, (_hours >= 12)? "PM" : "AM");
            }
            else if (_char == "B") //Time of day phrase, formatted version
            {
                //TODO
                //https://www.unicode.org/cldr/charts/45/supplemental/day_periods.html
                //in the morning, in the evening etc.
                
                //morning1
                //morning2
                //afternoon1
                //afternoon2
                //afternoon1
                //afternoon2
                //night1
                //night2
                buffer_write(_buffer, buffer_text, (_hours >= 12)? "PM" : "AM");
            }
            else
            {
                buffer_write(_buffer, buffer_text, _char);
            }
        }
        
        ++_formatPos;
    }
    
    buffer_write(_buffer, buffer_u8, 0x00);
    return buffer_peek(_buffer, 0, buffer_string);
}