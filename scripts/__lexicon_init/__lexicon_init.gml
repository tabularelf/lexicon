#macro __LEXICON_STRUCT (__lexicon_init())
#macro LEXICON_VERSION "2.1.4"
#macro LEXICON_CREDITS "TabularElf - https://tabelf.link/"

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
			language: "unknown",
			locale: "unknown",
			replaceChrLegacy: "%s",
			replaceChr: LEXICON_STRUCT_REPLACE_CHR_SYMBOLS,
			fileAsyncList: [],
			cacheUpdate: true,
			cacheMap: ds_map_create(),
			cacheList: ds_list_create(),
			langDB: __lexicon_localization_map_init()[$ lexicon_get_os_locale()] ?? __lexicon_localization_map_init()[$ "en"],
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
		} catch(_ex) {
			_inst.hashAvailable = false;	
		}
		
		
		time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, method(undefined, __lexicon_gc_cache), [], -1));
		
		lexicon_callback_define("DateTime", true, function() {
			static _global = __lexicon_init();
			var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			return _global.langDB.__GetDateTimeString(_dt, _global.dateLength, _global.timeLength);
		});
		
		lexicon_callback_define("Date", true, function() {
			static _global = __lexicon_init();
			var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			return _global.langDB.__GetDateString(_dt, _global.dateLength);
		});
		
		lexicon_callback_define("Time", true, function() {
			static _global = __lexicon_init();
			var _dt = _global.dateTimeFunc != undefined ? _global.dateTimeFunc() : date_current_datetime();
			return _global.langDB.__GetTimeString(_dt, _global.timeLength);
		});
		
		lexicon_callback_define("Currency", false, function() {
			static _global = __lexicon_init();
			return "$";
		});
	}
	
	return _inst;
}

__lexicon_trace("v" + LEXICON_VERSION + " initialized! Created by " + LEXICON_CREDITS);