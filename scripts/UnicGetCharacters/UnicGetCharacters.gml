// Feather disable all

/// Returns a string containing all characters needed to render out all Unicode formats for the
/// given locale. This includes symbols, month names, and day names.
/// 
/// @param [localeCode]

function UnicGetCharacters(_localeCode = undefined)
{
    static _system   = __UnicSystem();
    static _database = __UnicDatabaseCLDR();
    
    _localeCode ??= _system.__locale;
    
    if (not UnicLocaleExists(_localeCode)) return "";
    
    var _data = _database[$ _localeCode];
    var _foundDict = {};
    
    //We always need numerals 0...9
    var _i = 0;
    repeat(10)
    {
        _foundDict[$ _i] = true;
        ++_i;
    }
    
    //Force fallback characters
    _foundDict[$ "-"] = true;
    _foundDict[$ ","] = true;
    _foundDict[$ "."] = true;
    _foundDict[$ "%"] = true;
    _foundDict[$ ":"] = true;
    
    var _funcAddString = function(_foundDict, _string, _systemChars = "")
    {
        var _inString = false;
        var _prevChar = undefined;
        var _i = 1;
        repeat(string_length(_string))
        {
            var _char = string_char_at(_string, _i);
            if (_char == "'")
            {
                if (_prevChar == "'") //Double '' is a plain old '
                {
                    _foundDict[$ _char] = true;
                }
                else
                {
                    _inString = not _inString;
                }
            }
            else
            {
                if (_inString || (string_pos(_char, _systemChars) <= 0))
                {
                    _foundDict[$ _char] = true;
                }
            }
            
            _prevChar = _char;
            ++_i;
        }
    }
    
    var _contextStruct = {
        __foundDict:     _foundDict,
        __funcAddString: _funcAddString,
        __systemChars:   "",
    };
    
    var _methodAddStruct = method(_contextStruct,
    function(_char, _pos)
    {
        __funcAddString(__foundDict, _char, __systemChars);
    });
    
    _funcAddString(_foundDict, _data.decimalFormat,    "#");
    _funcAddString(_foundDict, _data.currencyFormat,   "#");
    _funcAddString(_foundDict, _data.percentageFormat, "#");
    
    string_foreach(_data.symbols, _methodAddStruct);
    
    array_foreach(_data.daysFormat.short,       _methodAddStruct);
    array_foreach(_data.daysFormat.narrow,      _methodAddStruct);
    array_foreach(_data.daysFormat.abbreviated, _methodAddStruct);
    array_foreach(_data.daysFormat.wide,        _methodAddStruct);
    
    array_foreach(_data.monthsFormat.narrow,      _methodAddStruct);
    array_foreach(_data.monthsFormat.abbreviated, _methodAddStruct);
    array_foreach(_data.monthsFormat.wide,        _methodAddStruct);
    
    _contextStruct.__systemChars = "hHkKmsabBzv";
    struct_foreach(_data.timeFormat, _methodAddStruct);
    
    _contextStruct.__systemChars = "GyYMLEcQ";
    struct_foreach(_data.dateFormat, _methodAddStruct);
    
    _contextStruct.__systemChars = "01{}";
    struct_foreach(_data.dateTimeFormat.availableFormats, _methodAddStruct);
    
    //Add the convenience formats too for full coverage
    _funcAddString(_foundDict, _data.dateTimeFormat.full,   _contextStruct.__systemChars);
    _funcAddString(_foundDict, _data.dateTimeFormat.long,   _contextStruct.__systemChars);
    _funcAddString(_foundDict, _data.dateTimeFormat.short,  _contextStruct.__systemChars);
    _funcAddString(_foundDict, _data.dateTimeFormat.medium, _contextStruct.__systemChars);
    
    var _array = struct_get_names(_foundDict);
    array_sort(_array, true);
    return string_concat_ext(_array);
}