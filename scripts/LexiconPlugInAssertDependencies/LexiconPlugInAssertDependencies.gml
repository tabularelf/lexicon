// feather ignore all
/// @param {String} plugInA
/// @param {String} plugInB
/// @param {String} ...
function LexiconPlugInAssertDependencies(_plugInAName, _plugInBName) { 
	for(var _i = 0; _i < argument_count; _i += 2;) {
		var _plugInA = __LexiconGetPlugIn(argument[_i]);
		if (is_undefined(_plugInA)) {
			__LexiconError($"PlugIn \"{argument[_i]}\" required as a dependency but cannot be found! Please import this missing plug-in!");
			return;
		}

		var _plugInB = __LexiconGetPlugIn(argument[_i+1]);
		if (is_undefined(_plugInB)) {
			__LexiconError($"PlugIn \"{argument[_i+1]}\" required as a dependency but cannot be found! Please import this missing plug-in!");
			return;
		}

		if (!__LexiconPlugInCompareVersion(_plugInB.version, _plugInA.version)) {
			__LexiconError($"PlugIn \"{argument[_i+1]}\" mismatch version! Expected \"{_plugInA.version}\", got \"{_plugInB.version}\"!");
			return;
		}
	}
}