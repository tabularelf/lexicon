// feather ignore all
function LexiconPlugInSetVariableModifier(_name, _callback) {
	static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
	_dynamicModifiers[$ _name]	= {
		callback: is_method(_callback) ? _callback : method(undefined, _callback),
	};
}