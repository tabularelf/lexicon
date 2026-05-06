/// @param {Function | Undefined} callback
function LexiconPlugInSetMissingEntryHandler(_callback) {
	static _global = __LexiconSystem();
	_global.__missingTextHandler = is_callable(_callback) ? (
		is_method(_callback) ? _callback : method(undefined, _callback)
	) : undefined;
}