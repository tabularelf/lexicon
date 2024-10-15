/// @param {String} name
/// @param {Function} callback
/// @param {Bool} [updateCache]
/// feather ignore all
function lexicon_dynamic_define(_name, _func, _updateCache = true) {
	static _global = __lexicon_init();

	_global.dynamicMap[$ _name] = [_func, _updateCache];
}