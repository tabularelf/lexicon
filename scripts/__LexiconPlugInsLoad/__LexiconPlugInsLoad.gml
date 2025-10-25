// feather ignore all
/// @ignore
function __LexiconPlugInsLoad() {
	static _global = __LexiconSystem();
	static _plugIns = _global.__plugIns;
	
	if (_global.__plugInsLoaded) return;

	_global.__plugInsLoaded = true;
	_global.__allowRegisteringCallbacks = true;
	array_foreach(_plugIns, function(_elm, _index) {
		if (!__LexiconPlugInCompareVersion(_elm.targetVersion, __LEXICON_VERSION)) {
			__LexiconError($"Lexicon target version \"{_elm.targetVersion}\" Does not match {__LEXICON_VERSION}!");
			return;
		}
		_elm.__initCallback();
		delete _elm.__initCallback;
	});
	_global.__allowRegisteringCallbacks = false;
}