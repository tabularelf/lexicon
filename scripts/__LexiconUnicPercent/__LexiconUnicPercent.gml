// feather ignore all
/// @ignore
function __LexiconUnicPercent(_num, _places = "2") {
	static _inst = __LexiconUnicSystem();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	try {
		_num = real(_num);
		_places = real(_places);
	} catch(_) {
		_num = NaN;
		_places = 2;
	}

	return UnicPercent(_num, _places, _locale);
}