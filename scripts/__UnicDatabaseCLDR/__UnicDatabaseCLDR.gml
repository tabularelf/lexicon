/// Feather ignore all
/// @ignore
function __UnicDatabaseCLDR() {
	static _inst = undefined;
	if (!is_undefined(_inst)) return _inst;

	_inst = __UnicJSONLoad("unic_cldr.json");

	return _inst;
};
__UnicDatabaseCLDR();