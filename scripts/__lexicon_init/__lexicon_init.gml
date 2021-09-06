#macro LEXICON_STRUCT global.__lexicon_struct
#macro LEXICON_VERSION "2.0.0"
#macro LEXICON_CREDITS "TabularElf at https://github.com/tabularelf"

// Setup Lexicon well before anything else
LEXICON_STRUCT = undefined;

// Init Lexicon
__lexicon_init();

function __lexicon_init() {
	if (LEXICON_STRUCT != undefined) {
		__lexicon_throw("Lexicon already Initialized");
		return false;
	}
	
	LEXICON_STRUCT = {
		languageMap: {},
		localeMap: {},
		textEntries: {},
		language: "",
		locale: "",
		replaceChr: "%s",
		fileAsyncList: [],
		cacheMap: ds_map_create(),
		cacheList: ds_list_create()
	}

	show_debug_message("Lexicon " + LEXICON_VERSION + " initialized!");
	show_debug_message("Created by " + LEXICON_CREDITS);
}