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
	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	var _result;
	switch(_length) {
		case "short":
			_result = UnicClock(_time, false, _locale);
		break;
		default:
			_result = UnicClock(_time, true, _locale);
		break;
	}

	return _result;
});

LexiconPlugInSetDynamic("DATE", function(_length = "3") {
	static _inst = __LexiconUnicSystem();
	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	var _result;
	switch(_length) {
		case "short":
			_result = UnicDate(_time, 0, _locale);
		break;

		case "medium":
		case "narrow":
			_result = UnicDate(_time, 1, _locale);
		break;

		case "long":
			_result = UnicDate(_time, 2, _locale);
		break;

		case "full":
			_result = UnicDate(_time, 3, _locale);
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
      
LexiconPlugInSetDynamic("DATETIME", function(_length = "3") {
	static _inst = __LexiconUnicSystem();
	var _time = _inst.datetime ?? date_current_datetime();
	var _locale = (_inst.autoLocale ? _inst.locale : UnicGetLocale());

	var _result;
	switch(_length) {
		case "short":
			_result = UnicDateTime(_time, 0, false, _locale);
		break;

		case "medium":
		case "narrow":
			_result = UnicDateTime(_time, 1, true, _locale);
		break;

		case "long":
			_result = UnicDateTime(_time, 2, true, _locale);
		break;

		case "full":
			_result = UnicDateTime(_time, 3, true, _locale);
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