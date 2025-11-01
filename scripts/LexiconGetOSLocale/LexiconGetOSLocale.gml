// feather ignore all
function LexiconGetOSLocale() {
	return os_get_language() + (os_get_region()  != "" ? "_" + os_get_region() : "");
}