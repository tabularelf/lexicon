#macro __LEXICON_STRUCT (__lexicon_init())
#macro __LEXICON_VERSION "3.0.5"
#macro __LEXICON_CREDITS "@TabularElf - https://tabelf.link/"

// Setup Lexicon well before anything else

// Init Lexicon

__lexicon_init();

/// @ignore
function __lexicon_init() {
	static _inst =  undefined;
	if (_inst == undefined) {
		_inst = {
			languageMap: {},
			localeMap: {},
			fallbackLocaleMap: {},
			fallbackLanguage: "",
			forceLoadFile: false,
			textEntries: {},
			textEntriesArray: {},
			language: "unknown",
			locale: "unknown",
			isReady: false,
			replaceChrLegacy: "%s",
			replaceChr: __LEXICON_STRUCT_REPLACE_CHR_SYMBOLS,
			fileAsyncList: [],
			cacheUpdate: true,
			cacheMap: ds_map_create(),
			cacheList: ds_list_create(),
			//langDB: __lexicon_localization_map_init()[$ lexicon_get_os_locale()] ?? __lexicon_localization_map_init()[$ "en"],
			dateTimeFunc: undefined,
			dateLength: lexicon_length.FULL,
			timeLength: lexicon_length.FULL,
			frame: 0,
			dynamicMap: {},
			hashAvailable: true
		}
		
		// Check if hash is available
		try {
			variable_get_hash("foo");	
		} catch(_) {
			_inst.hashAvailable = false;	
		}
		
		
		time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, method(undefined, __lexicon_gc_cache), [], -1));
		
		lexicon_dynamic_define("DateTime", function() {
			//static _global = __lexicon_init();
			//var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			//return _global.langDB.__GetDateTimeString(_dt, _global.dateLength, _global.timeLength);
            return "Unknown";
		});
		
		lexicon_dynamic_define("Date", function() {
			//static _global = __lexicon_init();
			//var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			//return _global.langDB.__GetDateString(_dt, _global.dateLength);
            return "Unknown";
		});
		
		lexicon_dynamic_define("Time", function() {
			//static _global = __lexicon_init();
			//var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			//return _global.langDB.__GetTimeString(_dt, _global.timeLength);
            return "Unknown";
		});
		
		var _dec = function(_num, _totalPlaces, _decimalPlaces) {
			//static _global = __lexicon_init();
			//return _global.langDB.__GetDecimal(_num, _totalPlaces, _decimalPlaces);
            return "Unknown";
		};
		
		lexicon_dynamic_define("Dec", _dec, false);
		
		lexicon_dynamic_define("Decimal", _dec, false);
		
		lexicon_dynamic_define("Currency", function(_num) {
			//static _global = __lexicon_init();
			//return "$";
            return "Unknown";
		}, false);
	}
	
	return _inst;
}

__lexicon_trace("v" + __LEXICON_VERSION + " initialized! Created by " + __LEXICON_CREDITS);