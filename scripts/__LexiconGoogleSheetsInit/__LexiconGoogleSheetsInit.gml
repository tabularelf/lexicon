#macro __LEXICON_GOOGLE_SHEETS_VERSION "1.0.0"
// feather ignore all
LexiconPlugInDefine("Lexicon.GoogleSheets", "TabularElf", __LEXICON_GOOGLE_SHEETS_VERSION, "4.0", function() {
	if (GM_build_type == "run") || (__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION) {
		__LexiconGoogleSheetsPrepare();
		
		if (__LEXICON_ON_DESKTOP) && (GM_is_sandboxed) {
			__LexiconError($"Lexicon.GoogleSheets - Sandbox is enabled! Please disable it as per your desktop target!");
			return;
		}
		__LexiconGoogleSheetsPrepare();

		if (__LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE) {
			call_later(__LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE_TIME_SECONDS, time_source_units_seconds, LexiconGSUpdate, true);
		}

		call_later(1, time_source_units_frames, function() {
			if (!instance_exists(__LexiconGoogleSheetsManager)) {
				// Try activating
				instance_activate_object(__LexiconGoogleSheetsManager);
				if (instance_exists(__LexiconGoogleSheetsManager)) {
					__LexiconError($"{nameof(__LexiconGoogleSheetsManager)} was deactivated!\nPlease ensure to call \"instance_actiave_object(__LexiconGoogleSheetsManager)\" when deactivating!");
				} else {
					__LexiconError($"{nameof(__LexiconGoogleSheetsManager)} was destroyed!\nPlease do not destroy ALL objects!");
				}	
			}
		});
	}

	__LexiconGoogleSheetsTrace($"v{__LEXICON_GOOGLE_SHEETS_VERSION} initialised!");
});