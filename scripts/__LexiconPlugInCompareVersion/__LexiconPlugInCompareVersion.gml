// feather ignore all
/// @ignore
function __LexiconPlugInCompareVersion(_versionTarget, _versionCurrent) {
	static _split = function(_version) {
		var _formatter = function(_elm, _index) {
			static _realSafe = function(_value) {
				try {
					return real(_value);
				} catch(_) {
					return 0;
				}
			}
			return _realSafe(string_digits(_elm));
		};

		var _versionSplit = string_split(_version, ".", true);
		array_map_ext(_versionSplit, _formatter);

		if (array_length(_versionSplit) == 1) {
			_versionSplit[1] = 0;
		}
		return _versionSplit;
	};

	var _versionTargetSplit = _split(_versionTarget);
	var _versionCurrentSplit = _split(_versionCurrent);

	if (_versionTargetSplit[0] != _versionCurrentSplit[0]) return false;
	if (_versionTargetSplit[1] > _versionCurrentSplit[1]) return false;

	return true;
}