// feather ignore all
/// @param {String} filename
/// @param {String} sheetId
/// @param {String} sheetPage
function LexiconGSDeclare(_filename, _sheetId, _sheetPage) {
	var _connected = os_is_network_connected(network_connect_passive);
	if ((GM_build_type == "exe") && (!__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION)) || (!_connected) {
		if ((GM_build_type == "run") || (__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION)) && (!_connected) {
			__LexiconGoogleSheetsTrace("No internet connection detected! Falling back to local file.");
		}
		LexiconIndexDeclareFromFile(_filename);
	} else {
		__LexiconGoogleSheetsPrepare();
		
		var _filepath;
		if (!__LEXICON_ON_DESKTOP) {
			_filepath = (temp_directory ?? "") + ".lexicon/" + _filename;
		} else {
			_filepath = filename_path(GM_project_filename) + "datafiles/" + _filename
		}

		if (!__LEXICON_ON_DESKTOP) {
			__LexiconGoogleSheetsTrace("Not on desktop! Temporarily storing in a temp directory!");
		}
    	
		with(__LexiconGoogleSheetsManager) {
			var _id = http_get_file($"https://docs.google.com/spreadsheets/d/{_sheetId}/export?format=csv&gid={_sheetPage}", _filepath);
			array_push(requests, {
				id: _id,
				filename: _filename,
				filepath: _filepath,
				sheetId: _sheetId,
				sheetPage: _sheetPage,
				hasInit: false,
			});
		}
	}
}