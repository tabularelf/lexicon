// feather ignore all
function LexiconPlugInDefine(_alias, _author, _version, _targetLexiconVersion, _initCallback) {
	static _global = __LexiconSystem();
	array_push(_global.__plugIns, new __LexiconPlugInClass(_alias, _author, _version, _targetLexiconVersion, _initCallback));
}