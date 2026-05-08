// feather ignore all
/// @param {String} plugInName
/// @param {String} targetVersion
/// @param {String} ...
function LexiconPlugInAssertDependencies(_plugInName, _targetVersion) { 
	for(var _i = 0; _i < argument_count; _i += 2;) {
		var _plugIn = __LexiconGetPlugIn(string_trim(argument[_i]));
		if (is_undefined(_plugIn)) {
			__LexiconError($"Plug-In \"{argument[_i]}\" required as a dependency but cannot be found! Please import this missing plug-in!");
			return;
		}

		if (!__LexiconPlugInCompareVersion(string_trim(argument[_i+1]), _plugIn.version)) {
			__LexiconError($"Plug-In \"{argument[_i+1]}\" mismatch version! Expected \"{argument[_i+1]}\", got \"{_plugIn.version}\"!");
			return;
		}
	}
}