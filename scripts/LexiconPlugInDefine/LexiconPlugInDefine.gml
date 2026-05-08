// feather ignore all
/// @param {String} name The name of the plug-in
/// @param {String} author The name of the author
/// @param {String} version The version to use. i.e. 1.4.
/// @param {String} lexicon_version The version of Lexicon to target towards. i.e. 4.0.
/// @param {Function} init_callback The callback that this plug-in will call during plug-in loading.
function LexiconPlugInDefine(_alias, _author, _version, _targetLexiconVersion, _initCallback) {
	static _global = __LexiconSystem();
	array_push(_global.__plugIns, new __LexiconPlugInClass(string_trim(_alias), string_trim(_author), string_trim(_version), string_trim(_targetLexiconVersion), _initCallback));
}