/*
	Format:
	{
		firstDay: 0,
		dateTimePattern: {
			time: 1,
			date: 0
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
			medium: "MMM-D-Y",
			short: "M-D-Y"
		},
		timePattern: {
			full: "h:mm:ss a zzzz"
			long: "	h:mm:ss a z",
			medium: "h:mm:ss a",
			short: "h:mm a"
		}
		}
	}
*/
function __lexicon_date_format_class(_struct) constructor {
	__firstDay = _struct.firstDay;
	__dateTimePattern = _struct.dateTimePattern;
	__dayNames = _struct.dayNames;
	__monthNames = _struct.monthNames;
	__amPM = _struct.amPM;
	/*var _dateFormat = _struct.dateFormat;
	__dateFormat = _dateFormat;
	__dateFormatDashes = (_dateFormat == lexicon_date_format.DAY_MONTH_YEAR_DASHES ||
						  _dateFormat == lexicon_date_format.YEAR_MONTH_DAY_DASHES ||
						  _dateFormat == lexicon_date_format.YEAR_MONTH_DAY_DASHES);
	__dateFormatDots = (_dateFormat == lexicon_date_format.DAY_MONTH_YEAR_DOTS ||
						  _dateFormat == lexicon_date_format.YEAR_MONTH_DAY_DOTS ||
						  _dateFormat == lexicon_date_format.YEAR_MONTH_DAY_DOTS);
	
	static __GetDateString = function(_date = date_current_datetime()) {
		var _year = date_get_year(_date);
		var _month = date_get_month(_date);
		var _day = date_get_day(_date);
		var _string;
		switch(__dateFormat) {
			case lexicon_date_format.DAY_MONTH_YEAR_SLASHES:
			case lexicon_date_format.DAY_MONTH_YEAR_DASHES:	
			case lexicon_date_format.DAY_MONTH_YEAR_DOTS:
				_string = string(_day) + "-" + string(_month) + "-" + string(_year);
			break;
			
			case lexicon_date_format.MONTH_DAY_YEAR_SLASHES:
			case lexicon_date_format.MONTH_DAY_YEAR_DASHES:	
			case lexicon_date_format.MONTH_DAY_YEAR_DOTS:
				_string = string(_month) + "-" + string(_day) + "-" + string(_year);
			break;
			
			case lexicon_date_format.YEAR_MONTH_DAY_SLASHES:
			case lexicon_date_format.YEAR_MONTH_DAY_DASHES:	
			case lexicon_date_format.YEAR_MONTH_DAY_DOTS:
				_string = string(_year) + "-" + string(_month) + "-" + string(_day);
			break;
		}
		
		if (!__dateFormatDashes) _string = string_replace_all(_string, "-", "/");
		if (!__dateFormatDots) _string = string_replace_all(_string, "-", ".");
		return _string;
	}*/
}