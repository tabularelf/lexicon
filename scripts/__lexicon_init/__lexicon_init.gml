#macro __LEXICON_STRUCT (__lexicon_init())
#macro LEXICON_VERSION "2.1.4"
#macro LEXICON_CREDITS "TabularElf - https://tabelf.link/"

// Setup Lexicon well before anything else

// Init Lexicon

__lexicon_init();

/// @ignore
function __lexicon_init() {
	static _inst =  {
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
		dateLength: lexicon_length.SHORT,
		timeLength: lexicon_length.SHORT,
		frame: 0
	}
	
	return _inst;
}

__lexicon_trace("v" + LEXICON_VERSION + " initialized! Created by " + LEXICON_CREDITS);