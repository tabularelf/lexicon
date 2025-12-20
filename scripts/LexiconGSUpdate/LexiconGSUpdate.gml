// feather ignore all
function LexiconGSUpdate() {
	if (GM_build_type == "exe") && (!__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION) {
		__LexiconGoogleSheetsTrace("Not available in production builds!");
		return;
	}

	with(__LexiconGoogleSheetsManager) {
		array_foreach(periodicRequests, function(_elm) {
			_elm.id = http_get_file($"https://docs.google.com/spreadsheets/d/{_elm.sheetId}/export?format=csv&gid={_elm.sheetPage}", _elm.filepath);
		});
        	 
		array_copy(requests, 0, periodicRequests, 0, array_length(periodicRequests));
		array_resize(periodicRequests, 0);
	}
}