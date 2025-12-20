// feather ignore all
/// @param {String} filename
/// @param {String} sheetId
/// @param {String} sheetPage
function LexiconGSDeclare(_filename, _sheetId, _sheetPage = "0") {
	if (GM_build_type == "exe") && (!__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION) {
		LexiconIndexDeclareFromFile(_filename);
	} else {
		__LexiconGoogleSheetsPrepare();
		
		var _filepath = filename_path(GM_project_filename) + "datafiles/" + _filename;
    	
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