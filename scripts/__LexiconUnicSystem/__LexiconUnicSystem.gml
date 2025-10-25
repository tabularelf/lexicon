// feather ignore all
/// @ignore
function __LexiconUnicSystem() {
	static _inst = {
		datetime: undefined,
		autoLocale: true,
		language: undefined,
		locale: undefined,
	};

	return _inst;
}

LexiconPlugInSetDynamic("TIME", function(_length = "full") {
	static _inst = __LexiconUnicSystem();
	static _cache = [
		"",
		"",
	];
	static _cacheTime = -1;

	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());
	var _second = date_get_second(_time);
	var _result;

	if (_second != _cacheTime) {
		_cacheTime = _second;
		_cache[0] = UnicClock(_time, false, _locale);
		_cache[1] = UnicClock(_time, false, _locale);
	}

	switch(_length) {
		case "short":
			_result = _cache[0];
		break;
		default:
			_result = _cache[1];
		break;
	}

	return _result;
});

LexiconPlugInSetDynamic("DATE", function(_length = "full") {
	static _inst = __LexiconUnicSystem();
	static _cache = [
		"",
		"",
		"",
		"",
	];
	static _cacheTime = -1;

	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());
	var _second = date_get_second(_time);
	var _result;

	if (_second != _cacheTime) {
		_cacheTime = _second;
		_cache[0] = UnicDate(_time, 0, _locale);
		_cache[1] = UnicDate(_time, 1, _locale);
		_cache[2] = UnicDate(_time, 2, _locale);
		_cache[3] = UnicDate(_time, 3, _locale);
	}

	switch(_length) {
		case "short":
			_result = _cache[0];
		break;

		case "medium":
		case "narrow":
			_result = _cache[1];
		break;

		case "long":
			_result = _cache[2];
		break;

		case "full":
			_result = _cache[3];
		break;
		
		default:
			var _num;
			try {
				_num = real(_length);
			} catch(_){
				_num = 3;
			}

			_result = UnicDate(_time, _num, _locale);
		break;
	}

	return _result;
});
      
LexiconPlugInSetDynamic("DATETIME", function(_length = "full") {
	static _inst = __LexiconUnicSystem();
	static _cache = [
		"",
		"",
		"",
		"",
	];
	static _cacheTime = -1;

	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());
	var _second = date_get_second(_time);
	var _result;

	if (_second != _cacheTime) {
		_cacheTime = _second;
		_cache[0] = UnicDateTime(_time, 0, true, _locale);
		_cache[1] = UnicDateTime(_time, 1, true, _locale);
		_cache[2] = UnicDateTime(_time, 2, true, _locale);
		_cache[3] = UnicDateTime(_time, 3, true, _locale);
	}
	switch(_length) {
		case "short":
			_result = _cache[0];
		break;

		case "medium":
		case "narrow":
			_result = _cache[1];
		break;

		case "long":
			_result = _cache[2];
		break;

		case "full":
			_result = _cache[3];
		break;
		
		default:
			var _num;
			try {
				_num = real(_length);
			} catch(_){
				_num = 3;
			}

			_result = UnicDateTime(_time, _num, (_num == 0 ? false : true), _locale);
		break;
	}

	return _result;
});	

LexiconPlugInSetDynamic("PERCENT", __LexiconUnicPercent);
LexiconPlugInSetVariableModifier("percent", __LexiconUnicPercent)

LexiconPlugInSetDynamic("CURRENCY", __LexiconUnicCurrency);
LexiconPlugInSetVariableModifier("currency", __LexiconUnicCurrency)

LexiconPlugInSetDynamic("NUMBER", __LexiconUnicNumber);
LexiconPlugInSetVariableModifier("number", __LexiconUnicNumber);

LexiconPlugInSetDynamic("INTEGER", __LexiconUnicInteger);
LexiconPlugInSetVariableModifier("integer", __LexiconUnicInteger);