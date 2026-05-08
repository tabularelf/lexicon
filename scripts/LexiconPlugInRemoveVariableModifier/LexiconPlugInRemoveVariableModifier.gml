// feather ignore all
/// @param {String} name
function LexiconPlugInRemoveVariableModifier(_name) {
	static _dynamicModifiers = __LexiconSystem().__globalDynamicModifiers;
	delete _dynamicModifiers[$ string_trim(_name)];
	struct_remove(_dynamicModifiers, string_trim(_name));
}