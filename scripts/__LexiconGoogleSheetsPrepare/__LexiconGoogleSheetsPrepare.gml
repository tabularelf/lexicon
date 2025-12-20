// feather ignore all
/// @ignore
function __LexiconGoogleSheetsPrepare() {
	if (!instance_exists(__LexiconGoogleSheetsManager)) {
		instance_create_depth(0, 0, 0, __LexiconGoogleSheetsManager);
	}
}