/// @func lexicon_get_os_language()
function lexicon_get_os_language() {
	static _map =__lexicon_localization_map_init();
	var _region = os_get_region();
	var _language = os_get_language();
	var _resultStr = _language + (_region != "" ? "-" + _region : "");
	var _result = _map[$ _resultStr];
	return (_result != undefined ? _result.__name : "Unknown");
}