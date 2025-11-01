// feather ignore all
/// @param {String} name
/// @param {Function} callback
function LexiconPlugInSetVariableModifier(_name, _callback) {
	static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
	_dynamicModifiers[$ _name]	= {
		callback: is_method(_callback) ? _callback : method(undefined, _callback),
	};
}