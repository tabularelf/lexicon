// feather ignore all
/// @param {String} filename
/// @param {String} sheetId
/// @param {String} sheetPage
/// @param {Function} callback
function LexiconGSDeclare(_filename, _sheetId, _sheetPage, _callback = undefined) {
	var _result = false;
	var _connected = os_is_network_connected(network_connect_passive);
	var _isOnDisk = false;
	if ((GM_build_type == "exe") && (!__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION)) || (!_connected) {
		if ((GM_build_type == "run") || (__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION)) && (!_connected) {
			__LexiconGoogleSheetsTrace("No internet connection detected! Falling back to local file.");
		}

		if (__LEXICON_GOOGLE_SHEETS_AUTO_DECLARE_FILES) {
			LexiconIndexDeclareFromFile(_filename);
		}
		_result = true;
	} else {
		__LexiconGoogleSheetsPrepare();
		
		var _filepath;
		if (!__LEXICON_ON_DESKTOP) {
			_filepath = (__LEXICON_ON_DESKTOP ? (temp_directory ?? ""): "") + ".lexicon/" + _filename;
		} else {
			if (GM_is_sandboxed) {
				__LexiconError($"Lexicon.GoogleSheets - Sandbox is enabled! Please disable it as per your desktop target!");
				return _result;
			}

			_filepath = filename_path(GM_project_filename) + "datafiles/" + _filename;
		}
		
		if (__LEXICON_GOOGLE_SHEETS_AUTO_DECLARE_FILES) && (file_exists(_filepath)) {
			_isOnDisk = true;
			LexiconIndexDeclareFromFile(_filepath);
		} 

		if (!__LEXICON_ON_DESKTOP) {
			__LexiconGoogleSheetsTrace("Not on desktop! Temporarily storing in a temp directory!");
		}
    	
		var _url = $"https://docs.google.com/spreadsheets/d/{_sheetId}/export?format=csv&gid={_sheetPage}";

		with(__LexiconGoogleSheetsManager) {
			var _id = http_get(_url);
			array_push(requests, {
				id: _id,
				filename: _filename,
				filepath: _filepath,
				sheetId: _sheetId,
				sheetPage: _sheetPage,
				hasInit: false,
				isOnDisk: _isOnDisk,
				callback: _callback,
				url: _url,
			});
		}

		_result = true;
	}
	return _result;
}
