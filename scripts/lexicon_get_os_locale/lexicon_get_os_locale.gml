/// @func lexicon_get_os_locale()
/// feather ignore all
function lexicon_get_os_locale() {
	var _region = os_get_region();
	var _language = os_get_language();
	return _language + (_region != "" ? "-" + _region : "");
}