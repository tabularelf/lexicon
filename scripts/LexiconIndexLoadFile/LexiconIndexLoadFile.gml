// feather ignore all
function LexiconIndexLoadFile(_filepath, _async = false, _lang = LexiconLanguageGetCurrent()) {
	__LexiconLoadFile(new __LexiconFileClass(_filepath), _lang, _async);
}