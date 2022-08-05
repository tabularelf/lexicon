/// @func lexicon_get_os_locale()
function lexicon_get_os_locale() {
	// Feather ignore all
	return os_get_language() + "-" + os_get_region();
}