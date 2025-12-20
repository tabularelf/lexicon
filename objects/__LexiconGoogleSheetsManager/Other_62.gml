var _len = array_length(requests);
var _id = async_load[? "id"];

for(var _i = 0; _i < _len; ++_i)	 {
	if (requests[@ _i].id == _id) {
		if (	async_load[? "status"] == 0) {
			if (!requests[ _i].hasInit) {
				__LexiconGoogleSheetsTrace($"File \"{requests[@ _i].filename}\" has been downloaded! Loading...");
				LexiconIndexDeclareFromFile(	requests[@ _i].filepath);
				requests[@ _i].hasInit = true;
			} else {
				__LexiconGoogleSheetsTrace($"File \"{requests[@ _i].filename}\" has been updated!");
			}

			array_push(periodicRequests, requests[@ _i]);
			array_delete(requests, _i, 1);
		}

		break;
	}
}