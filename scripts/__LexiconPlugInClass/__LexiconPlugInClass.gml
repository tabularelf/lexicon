// feather ignore all
/// @ignore
function __LexiconPlugInClass(_alias, _author, _version, _targetLexiconVersion, _initCallback) constructor {
	alias = _alias;
	author = _author;
	version = _version;
	targetVersion = _targetLexiconVersion;
	__initCallback = _initCallback;

	if (!__LexiconPlugInCompareVersion(targetVersion, __LEXICON_VERSION)) {
		__LexiconError($"Plug-In \"{_alias}\" Lexicon targeted version is \"{targetVersion}\", but Lexicon is \"{__LEXICON_VERSION}\"!");
	}
}