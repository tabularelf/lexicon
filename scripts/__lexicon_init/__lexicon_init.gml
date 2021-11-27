#macro __LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "2.0.3"
#macro LEXICON_CREDITS "@TabularElf - https://github.com/tabularelf"

// Setup Lexicon well before anything else
__LEXICON_STRUCT = undefined;

// Init Lexicon
__lexicon_init();

function __lexicon_init() {
	static _init = false;
	if (_init == false) {
		_init = true;
	
	
	__LEXICON_STRUCT = {
		languageMap: {},
		localeMap: {},
		fallbackLocaleMap: {},
		textEntries: {},
		language: "unknown",
		locale: "unknown",
		replaceChr: "%s",
		replaceChrStruct: LEXICON_STRUCT_REPLACE_CHR_SYMBOLS,
		fileAsyncList: [],
		cacheMap: ds_map_create(),
		cacheList: ds_list_create()
	}

	__lexicon_trace("Lexicon " + LEXICON_VERSION + " initialized!");
	__lexicon_trace("Created by " + LEXICON_CREDITS);
	}
}