/*
	Format:
	{
		firstDayOfWeek: 0,
		dateTimePattern: {
			time: 1,
			date: 0,
			str: "{1} {0}"
		},
		}
		dayNames: {
			narrow: ["M", "T", "W", "T", "F", "S", "S"],
			short: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
			long: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
		},
		monthNames: {
			narrow: [""J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", D"],
			short: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			long: ["January", "Feb", "March", "April", "May", "Jun", "July", "August", "September", "October", "November", "December"]
		},
		amPM: ["AM", "PM"],
		era: {
			bc: ["B", "BC", "Before Christ"],
			ad: ["A", "AD", "Anno Domini"]
		},
		datePattern: {
			full: "EEEE-MMMM-D-Y"
			long: "MMMM-D-Y",
			medium: "MMM D-Y",
			short: "M-D-Y"
		},
		timePattern: {
			full: "h:mm:ss a zzzz"
			long: "h:mm:ss a z",
			medium: "h:mm:ss a",
			short: "h:mm a"
		}
		}
	}
*/
function __lexicon_localization_class(_langName, _region, _locale = "", _format) constructor {
	static _map = __lexicon_localization_map_init();
	__name = _langName;
	__region = _region;
	__locale = _locale;
	__format = _format;
	__forceMilitaryTime = _format[$ "forceMilitaryTime"] ?? false;
	//_map[$ __name] = self;
	_map[$ _region + (_locale != "" ? "-" + _locale : "")] = self;
	var _name = __name;
	var _pos1 = string_pos("(", _name);
	var _pos2 = string_pos(")", _name);
	
	if (_pos1 != 0 && _pos2 != 0) {
		_name = string_delete(_name, _pos1-1, _pos2-_pos1+2);	
	}
	__nameShort = _name;
	_map[$ _name + "_" + _region + (_locale != "" ? "-" + _locale : "")] = self;
	
	static __GetDateString = function(_date = date_current_datetime(), _format = lexicon_length.SHORT) {
		var _year = date_get_year(_date);
		var _month = date_get_month(_date);
		var _day = date_get_day(_date);
		var _string;
		switch(_format) {
			case lexicon_length.SHORT:
				_string = string_replace_all(__format.datePattern.short, "Y", string(_year));
				_string = string_replace_all(_string, "M", string(_month));
				_string = string_replace_all(_string, "D", string(_day));
			break;
			
			case lexicon_length.MEDIUM:
				_string = string_replace_all(__format.datePattern.medium, "Y", string(_year));
				_string = string_replace_all(_string, "MMM", __format.monthNames.short[_month-1]);
				_string = string_replace_all(_string, "D", string(_day));
			break;
			
			case lexicon_length.LONG:
				_string = string_replace_all(__format.datePattern.long, "Y", string(_year));
				_string = string_replace_all(_string, "MMMM", __format.monthNames.long[_month-1]);
				_string = string_replace_all(_string, "D", string(_day));
			break;
			
			case lexicon_length.FULL:
				_string = string_replace_all(__format.datePattern.full, "Y", string(_year));
				_string = string_replace_all(_string, "EEEE", __format.dayNames.long[date_get_weekday(_date)]);
				_string = string_replace_all(_string, "MMMM", __format.monthNames.long[_month-1]);
				_string = string_replace_all(_string, "D", string(_day));
			break;
		}
		
		return _string;
	}
	
	static __GetTimeString = function(_date = date_current_datetime(), _format = lexicon_length.SHORT) {
		var _hour = date_get_hour(_date);
		var _minute = date_get_minute(_date);
		var _second = date_get_second(_date);
		var _isPM = false;
		var _useMilitaryTime = false;
		if (!_useMilitaryTime) || (!__forceMilitaryTime) {
			if (_hour >= 12) {
				if (_hour != 12) _hour = (_hour % 12);
				_isPM = true;
			} else if (_hour == 0) {
				_hour = 12;	
			}
		}
		var _minuteString = string_replace(string_format(round(_minute), 2, 0), " ", "0");
		var _secondString =	string_replace(string_format(round(_second), 2, 0), " ", "0");
		var _string;
		switch(_format) {
			case lexicon_length.SHORT:
				_string = string_replace_all(__format.timePattern.short, "h", string(_hour));
			break;
			
			case lexicon_length.MEDIUM:
				_string = string_replace_all(__format.timePattern.medium, "h", string(_hour));
			break;
			
			case lexicon_length.LONG:
				_string = string_replace_all(__format.timePattern.long, "h", string(_hour));
			break;
			
			case lexicon_length.FULL:
				_string = string_replace_all(__format.timePattern.full, "h", string(_hour));
			break;
		}
		
		_string = string_replace_all(_string, "mm", _minuteString);
		_string = string_replace_all(_string, "ss", _secondString);
		_string = string_replace_all(_string, " a", (!_useMilitaryTime ? " " + string(__format.amPM[_isPM]) : ""));
		_string = string_replace_all(_string, "zzzz", "UTC");
		_string = string_replace_all(_string, "z", "UTC");
		return _string;
	}
	
	static __GetDateTimeString = function(_date = date_current_datetime(), _formatA = lexicon_length.SHORT, _formatB = lexicon_length.SHORT) {
		static _results = ["", ""];
		_results[__format.dateTimePattern.date] = __GetDateString(_date, _formatA);
		_results[__format.dateTimePattern.time] = __GetTimeString(_date, _formatB);
		
		return __ArrayToString(__format.dateTimePattern.str, _results);
	}
	
	static __ArrayToString = function(_str, _array) {
		var _newStr = _str;
		var _i = 0;
		repeat(array_length(_array)) {
			_newStr = string_replace_all(_newStr, "{" + string(_i) + "}", _array[_i]);	
			++_i;
		}
		return _newStr;
	}
}