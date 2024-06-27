/// @func lexicon_get_os_language()
function lexicon_get_os_language() {
	static _map =__lexicon_localization_map_init();
	var _result = _map[$ lexicon_get_os_locale()];
	return (_result != undefined ? _result.__name : "Unknown (" + lexicon_get_os_locale() + ")");
}