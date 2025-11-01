// feather ignore all
/// @ignore
function __LexiconUnicNumber(_num, _places = 2) {
	static _inst = __LexiconUnicSystem();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());
	var _numReal;
	var _placesReal;
	
	try {
		_numReal = is_real(_num) ? _num: real(_num);
		_placesReal = real(_places);
	} catch(_) {
		_numReal = NaN;
		_placesReal = 2;
	}

	return UnicDecimal(_numReal, _placesReal, _locale);
}