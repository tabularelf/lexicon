// feather ignore all
/// @param {String} name
function LexiconPlugInRemoveDynamic(_name) {
	static _dynamics = __LexiconSystem().__globalDynamic;
	delete _dynamics[$ string_trim(_name)];
	struct_remove(_dynamics, string_trim(_name));
}