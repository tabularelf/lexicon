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
		replaceChr: "%s",
		replaceChrStruct: LEXICON_STRUCT_REPLACE_CHR_SYMBOLS,
		fileAsyncList: [],
		cacheUpdate: true,
		cacheMap: ds_map_create(),
		cacheList: ds_list_create()
	}
	
	return _inst;
}

__lexicon_trace("v" + LEXICON_VERSION + " initialized! Created by " + LEXICON_CREDITS);