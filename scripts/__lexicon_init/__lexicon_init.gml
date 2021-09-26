#macro __LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "2.0.2"
#macro LEXICON_CREDITS "TabularElf at https://github.com/tabularelf"

// Setup Lexicon well before anything else
__LEXICON_STRUCT = undefined;

// Init Lexicon
__lexicon_init();

function __lexicon_init() {
	if (__LEXICON_STRUCT != undefined) {
			__lexicon_throw("Lexicon already Initialized");
		return false;
	}
	
	__LEXICON_STRUCT = {
		languageMap: {},
		localeMap: {},
		fallbackLocaleMap: {},
		textEntries: {},
		language: "unknown",
		locale: "unknown",
		replaceChr: "%s",
		fileAsyncList: [],
		cacheMap: ds_map_create(),
		cacheList: ds_list_create()
	}

	__lexicon_trace("Lexicon " + LEXICON_VERSION + " initialized!");
	__lexicon_trace("Created by " + LEXICON_CREDITS);
}