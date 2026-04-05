var _len = array_length(requests);
var _id = async_load[? "id"];

for(var _i = 0; _i < _len; ++_i)	 {
	if (requests[@ _i].id == _id) {
		var _status = async_load[? "status"];
		switch (_status) {
			case 0:
			if (!requests[ _i].hasInit) {
				__LexiconGoogleSheetsTrace($"File \"{requests[@ _i].filename}\" has been downloaded! Loading...");
				file_copy(requests[_i].tempFilepath, requests[_i].filepath);

				if (__LEXICON_GOOGLE_SHEETS_AUTO_DECLARE_FILES) && (!requests[_i].isOnDisk) {
					LexiconIndexDeclareFromFile(requests[@ _i].filepath);
				}

				if (is_callable(requests[@ _i].callback)) {
					requests[@ _i].callback(requests[@ _i].filepath);
				}
				requests[@ _i].hasInit = true;
			} else {
				__LexiconGoogleSheetsTrace($"File \"{requests[@ _i].filename}\" has been updated!");
			}

			array_push(periodicRequests, requests[@ _i]);
			array_delete(requests, _i, 1);
			break;
			case 1:
				// Downloading still
			break;

			default: 
				// Some error
				__LexiconGoogleSheetsTrace($"File \"{requests[@ _i].filename}\" failed to download!");
				if (requests[_i].hasInit) {
					// Probably internet connection issue
					array_push(periodicRequests, requests[_i]);
				}
				array_delete(requests, _i, 1);
			break;
		}

		break;
	}
}