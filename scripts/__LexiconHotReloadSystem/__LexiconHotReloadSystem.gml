// feather ignore all
LexiconPlugInDefine("Lexicon.HotReload", "TabularElf", "1.1", "4.1", function() {
	if ((__LEXICON_HOT_RELOAD_ENABLED) && (__LEXICON_ON_DESKTOP) && (GM_build_type == "run")) || 
		(__LEXICON_HOT_RELOAD_ENABLED && __LEXICON_HOT_RELOAD_ALLOW_ON_EXPORT && __LEXICON_ON_DESKTOP && (GM_build_type == "exe")) {
		LexiconPlugInRegisterCallback(LexiconCallbackType.TEXT_ELEMENT_CREATED, undefined, function(_element) {
			static _list = __LexiconHotReloadList();
			ds_list_add(_list, weak_ref_create(_element));
		});
	
		time_source_start(time_source_create(time_source_global, __LEXICON_HOT_RELOAD_FILE_WATCH_UPDATE_SECONDS, time_source_units_seconds, __LexiconHotReloadTS, [], -1));
		time_source_start(time_source_create(time_source_global, __LEXICON_HOT_RELOAD_GC_FRAMES, time_source_units_frames, __LexiconHotReloadGCTS, [], -1));
	}

	if (__LEXICON_HOT_RELOAD_ENABLED && __LEXICON_ON_DESKTOP && GM_is_sandboxed && (GM_build_type == "run")) {
		__LexiconError("Cannot access bundle area for hot reloading from the IDE. Please disable sandbox!")
	}
});

if (debug_mode) {
	global.__LexiconHotReloadList = __LexiconHotReloadList();
}