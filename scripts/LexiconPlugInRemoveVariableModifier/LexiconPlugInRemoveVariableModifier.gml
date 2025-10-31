// feather ignore all
/// @param {String} name
function LexiconPlugInRemoveVariableModifier(_name) {
	static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
	delete _dynamicModifiers[$ _name];
	struct_remove(_dynamicModifiers, _name);
}