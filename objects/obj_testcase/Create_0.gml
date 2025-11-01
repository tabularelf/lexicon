assert = function(_a, _b, _msg) {
	if (_a != _b) {
		show_error(_msg + $" failed!\nGot \"{_a}\", expected \"{_b}\"!", true);
	} else {
		show_debug_message(_msg + " passed!");
		show_debug_message($"Result: {_a}");
	}
}

LexiconIndexDeclare("English", "en");
LexiconGlobalFallbackSet("en");
LexiconIndexDeclare("English (Universal)", "en_001");
LexiconIndexDeclare("English (Australia)", "en_AU", "en_001");

LexiconLanguageSet("en_AU");	

LexiconGlobalSet("playerName", "Alice");
LexiconGlobalSet("price", "12345");
LexiconGlobalSet("minutes", "1");

//show_message(LexiconLanguageGetLoaded());


LexiconPlugInSetVariableModifier("lowercase", string_lower);
LexiconPlugInSetVariableModifier("uppercase", string_upper);
LexiconPlugInSetVariableModifier("titlecase", UnicStringTitle);
LexiconPlugInSetVariableModifier("select", function(_var, _format) {
	show_message([_var, _format]);
});

LexiconPlugInSetVariableModifier("plural", function(_var, _options) {
	var _num = 0;
	try {
		_num = real(_var);
	} catch(_) {
		_num = 0;
	}

	var _str;
	switch(_num) {
		case 0:
			var _strStartPos = string_pos("zero", _options)+string_length("zero")+2;
			var _strEndPos = string_pos_ext("}", _options, _strStartPos);
		return string_replace(string_copy(_options, _strStartPos, _strEndPos-_strStartPos), "#", _num);
		case 1:
			var _strStartPos = string_pos("one", _options)+string_length("one")+2;
			var _strEndPos = string_pos_ext("}", _options, _strStartPos);
		return string_replace(string_copy(_options, _strStartPos, _strEndPos-_strStartPos), "#", _num);
		case 2:
			var _strStartPos = string_pos("two", _options)+string_length("two")+2;
			var _strEndPos = string_pos_ext("}", _options, _strStartPos);
		return string_replace(string_copy(_options, _strStartPos, _strEndPos-_strStartPos), "#", _num);
		default:
			var _strStartPos = string_pos("other", _options)+string_length("other")+2;
			var _strEndPos = string_pos_ext("}", _options, _strStartPos);
		return string_replace(string_copy(_options, _strStartPos, _strEndPos-_strStartPos), "#", _num);
	}
});

LexiconPlugInSetDynamic("lowercase", string_lower, true);
LexiconPlugInSetDynamic("uppercase", string_upper, true);
LexiconPlugInSetDynamic("titlecase", UnicStringTitle, true);
LexiconPlugInSetDynamic("concat", string_concat, true);

LexiconPlugInSetDynamic("toStatic", function(_str) {
	return _str;
}, true);

assert(Lexicon("Hello, world!").Get(), "Hello, world!", "Normal string");
assert(Lexicon("Hello, {0}!", "Bob").Get(), "Hello, Bob!", "Normal string template");
assert(Lexicon("Hello, {playerName}!").Get(), "Hello, Alice!", "Normal variable template");
assert(Lexicon("Hello, {lowercase, Bob}!").Get(), "Hello, bob!", "Lowercase string");
assert(Lexicon("Hello, {uppercase, {lowercase, Bob}}!").Get(), "Hello, BOB!", "Uppercase + lowercase string");

assert(Lexicon("Hello, {lowercase, Bob}!").Get(), "Hello, bob!", "Lowercase string");
assert(Lexicon("Hello, {uppercase, {lowercase, Bob}}!").Get(), "Hello, BOB!", "Uppercase + lowercase string");

assert(Lexicon("Hello, {lowercase, {0}}!", "Bob").Get(), "Hello, bob!", "Lowercase string template");
assert(Lexicon("Hello, {uppercase, {lowercase, {0}}}!", "Bob").Get(), "Hello, BOB!", "Uppercase + lowercase string template");

assert(Lexicon("Hello, {lowercase, {playerName}}!").Get(), "Hello, alice!", "Lowercase variable template");
assert(Lexicon("Hello, {uppercase, {lowercase, {playerName}}}!").Get(), "Hello, ALICE!", "Uppercase + lowercase variable template");
assert(Lexicon("Hello, {titlecase, {lowercase, {playerName}}}!").Get(), "Hello, Alice!", "Uppercase + lowercase variable template");
assert(Lexicon("Hello, {concat, {titlecase, {lowercase, {playerName}}}, {minutes}}!").Get(), "Hello, Alice1!", "Concat variable template");

playerName = Lexicon("{playerName}").SetBypassFrameCooldown(true);

assert(playerName.Get(), "Alice", "playerName");
LexiconGlobalSet("playerName", "Bob");
assert(playerName.Get(), "Bob", "playerName");