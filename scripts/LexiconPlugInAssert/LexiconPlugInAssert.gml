// feather ignore all
function LexiconPlugInAssertDependencies() { 
	for(var _i = 0; _i < argument_count; _i += 2;) {
		var _plugIn = __LexiconGetPlugIn(argument[_i]);
		if (is_undefined(_plugIn)) {
			__LexiconError($"PlugIn \"{argument[_i]}\" required as a dependency but cannot be found! Please import this missing plug-in!");
			return;
		}

		if (!__LexiconPlugInCompareVersion(argument[_i], _plugIn.__version)) {
			__LexiconError($"PlugIn \"{argument[_i]}\" required as a dependency but cannot be found! Please import this missing plug-in!");
			return;
		}
	}
}