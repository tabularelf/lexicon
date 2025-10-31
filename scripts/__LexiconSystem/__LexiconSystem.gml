#macro __LEXICON_VERSION "4.0.2"

enum __LEXICON_TYPE {
	CONSTANT,
	NORMAL,
	DYNAMIC,
	VARIABLE_MODIFIER,
	GLOBAL,
	ENTRY
}

enum LexiconCallbackType {
	ENTRY_UPDATE,
	ENTRY_COLLECT,
	ENTRY_CREATED,
	LANGUAGE_CREATED,
	LANGUAGE_UPDATE,
	LANGUAGE_POST_UPDATE,
	TEXT_ELEMENT_CREATED,
	LENGTH
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
		__parsers: __LexiconSystemParsers(),
		__plugIns: [],
		__fallback: undefined,
		__plugInsLoaded: false,
		__fileEntries: undefined,
		__fileModifyPath: undefined,
		__fileVariations: undefined,
		__asyncSlot: 0,
		__frame: 0,
		__globalVariableStruct: {},
		__gameRestarted: false,
		__languageLoaded: false,
		__forceResetFontCache: false,
		__allowRegisteringCallbacks: false,
		__frameTs: time_source_create(time_source_global, 1, time_source_units_frames, function() {static _global = __LexiconSystem(); _global.__frame++;}, [], -1),
		__asyncTs: time_source_create(time_source_global, 1, time_source_units_frames, __LexiconFileAsyncTS, [], -1),
		__datafilesFilepath: (__LEXICON_IS_REFERRABLE_TO_DATAFILES) ? filename_path(GM_project_filename) + "datafiles/" : "",
		__plugInCallbacks: array_create(LexiconCallbackType.LENGTH),
		__stackKeys: [],
	};

	if (__LEXICON_REFER_TO_BUNDLE_AREA) && (!__LEXICON_IS_REFERRABLE_TO_DATAFILES) {
		if (GM_build_type == "run") && (__LEXICON_ON_DESKTOP) {
			__LexiconError($"Cannot access datafiles! Please disable sandbox on desktop.\nOr turn off \"{nameof(__LEXICON_REFER_TO_BUNDLE_AREA)}\" in \"{nameof(__LexiconConfig)}\"!");
			return;
		} 
		__LexiconTrace("Cannot access datafiles! Game likely running on a non-desktop platform.");
	}

	if (_init) return _inst;
	_init = true;
	var _instPreview = _inst;
	for(var _i = 0; _i < LexiconCallbackType.LENGTH; ++_i) {
		_inst.__plugInCallbacks[_i] = [];
	}

	time_source_start(_inst.__frameTs);

	//if (__LEXICON_ADD_TEXT_AS_ENTRIES) && (__LEXICON_ON_DESKTOP) {
	//	if (GM_build_type == "run") && (GM_is_sandboxed) {
	//		show_error("Turn off sandbox pls thank", true);
	//		return;
	//	}
	//	_inst.__fileModifyPath = filename_path(GM_project_filename) + $"datafiles/{__LEXICON_FILE_TO_ADD_ENTRIES}";
    //
	//	var _buff = buffer_load(_inst.__fileModifyPath);
	//	_inst.__fileEntries = json_parse(buffer_read(_buff, buffer_text), function(_key, _value) {return _value});
	//	buffer_delete(_buff);
	//}

	call_later(1, time_source_units_frames, __LexiconPlugInsLoad);
	_inst.__fallback = __LexiconLanguageDummy();
	return _inst;
}

__LexiconSystem();

if (debug_mode) {
	global.__LexiconSystem = __LexiconSystem();
	global.__LexiconAsyncList = __LexiconFileAsyncList();
}