#macro __LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "2.1.6"
#macro LEXICON_CREDITS "TabularElf - https://tabelf.link/"

// Setup Lexicon well before anything else

// Init Lexicon

__lexicon_init();

/// @ignore
/// feather ignore all
function __lexicon_init() {
	static _init = false;
	if (_init == false) {
		_init = true;
	
	
	__LEXICON_STRUCT = {
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

	__lexicon_trace("v" + LEXICON_VERSION + " initialized! Created by " + LEXICON_CREDITS);
	}
}