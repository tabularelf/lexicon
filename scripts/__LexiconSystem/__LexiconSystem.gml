#macro __LEXICON_VERSION "4.1.3"

enum __LEXICON_TYPE {
	CONSTANT,
	NORMAL,
	DYNAMIC,
	VARIABLE_MODIFIER,
	GLOBAL,
	ENTRY
}

#macro __LEXICON_ON_WEB (os_browser != browser_not_a_browser)
#macro __LEXICON_ON_WINDOWS (os_type == os_windows)
#macro __LEXICON_ON_LINUX (os_type == os_linux)
#macro __LEXICON_ON_MACOSX (os_type == os_macosx)
#macro __LEXICON_ON_DESKTOP ((__LEXICON_ON_WINDOWS || __LEXICON_ON_MACOSX || __LEXICON_ON_LINUX) && !__LEXICON_ON_WEB)
#macro __LEXICON_IS_REFERRABLE_TO_DATAFILES ((__LEXICON_REFER_TO_BUNDLE_AREA) && (__LEXICON_ON_DESKTOP) && (!GM_is_sandboxed) && (GM_build_type == "run"))

// feather ignore all
/// @ignore
function __LexiconSystem() {
	static _init = false;
	
	static _inst = {
		__entries: {},
		__mainLanguage: undefined,
		__languages: [],
		__globalDynamic: {},
		__globalDynamicModifiers: {},
		__parsers: __LexiconParsersDatabase(),
		__systemParsers: __LexiconSystemParsers(),
		__sharedFiles: {},
		__sharedBuffers: [],
		__plugIns: [],
		__fallback: undefined,
		__plugInsLoaded: false,
		__fileEntries: undefined,
		__fileModifyPath: undefined,
		__fileVariations: undefined,
		__asyncSlot: 0,
		__frame: 0,
		__missingTextHandler: undefined,
		__globalVariableStruct: {},
		__gameRestarted: false,
		__deferred: false,
		__languageLoaded: false,
		__forceResetFontCache: false,
		__allowRegisteringCallbacks: false,
		__frameTs: time_source_create(time_source_global, 1, time_source_units_frames, function() {static _global = __LexiconSystem(); _global.__frame++;}, [], -1),
		__asyncTs: time_source_create(time_source_global, 1, time_source_units_frames, __LexiconFileAsyncTS, [], -1),
		__datafilesFilepath: (__LEXICON_IS_REFERRABLE_TO_DATAFILES) ? filename_path(GM_project_filename) + "datafiles/" : "",
		__plugInCallbacks: array_create(LexiconCallbackType.LENGTH),
		__stackKeys: [],
	};

	if (_init) return _inst;

	
	_init = true;

	if (__LEXICON_REFER_TO_BUNDLE_AREA) && (!__LEXICON_IS_REFERRABLE_TO_DATAFILES) {
		if (GM_build_type == "run") && (__LEXICON_ON_DESKTOP) {
			__LexiconError($"Cannot access datafiles! Please disable sandbox on desktop.\nOr turn off \"{nameof(__LEXICON_REFER_TO_BUNDLE_AREA)}\" in \"{nameof(__LexiconConfig)}\"!");
			return;
		} 
		__LexiconTrace("Cannot access datafiles! Game likely running on a non-desktop platform.");
	}

	try {
		UnicLocaleExists("en_AU");
		if (!file_exists("unic_cldr.bin")) throw true;
	} catch(_) {
		__LexiconError("Unic is not installed or is missing datafiles. Please ensure that Unic is installed properly.")
	}

	var _instPreview = _inst;
	for(var _i = 0; _i < LexiconCallbackType.LENGTH; ++_i) {
		_inst.__plugInCallbacks[_i] = [];
	}

	time_source_start(_inst.__frameTs);

	call_later(1, time_source_units_frames, __LexiconPlugInsLoad);
	_inst.__fallback = __LexiconLanguageDummy();
	return _inst;
}

__LexiconSystem();

if (debug_mode) {
	global.__LexiconSystem = __LexiconSystem();
	global.__LexiconAsyncList = __LexiconFileAsyncList();
}