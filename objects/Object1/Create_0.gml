var _globals = LexiconGlobalStructGet();
//_globals.value = "foobar";
_globals.playerName = "TabularElf";
_globals.num = 32;
_globals.num2 = 100;

show_debug_overlay(true, true);

draw_set_font(fnt_japanese);


//var _t = get_timer();
//repeat(1000) {
//	LexiconUnique("Foo {0}").Get();
//}
//show_message($"Lexicon.Get() {(get_timer() - _t) / 1000}ms");

LexiconPlugInSetDynamic("loveMeter", function(_num, _num2) {
	return string(real(_num2) / 100 * real(_num)) + "%";
}, false);

LexiconPlugInSetDynamic("myString", function() {
	return "a";
});

LexiconPlugInSetDynamic("toStatic", function(_str) {
	return _str;
}, true);

LexiconPlugInSetDynamic("collapse", function() {
	var _str = "";
	var _i = 0;
	repeat(argument_count) {
		_str += $" {argument[_i]}";
		++_i;
	};

	return _str;
}, true);

LexiconPlugInSetDynamic("superExpensiveLoop", function() {
	var _i = 0;
	while(_i < 10_000_000) {
		++_i;
	}
}, true);

LexiconPlugInSetDynamic("getNum", function() {
	return current_time / 1000;
}, true);

LexiconPlugInSetEntry("test.foo", "bar {0}")

show_debug_message("String speed test");
repeat(1) {
	var _t = get_timer();
	repeat(1000) {
		Lexicon("Foo {0}!").Get();
	}
	show_debug_message($"Lexicon.Get() {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique("Foo {0}!").Get();
	}
	show_debug_message($"LexiconUnique.Get() {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique(choose("Foo {0}!", "Foo {value}!")).Get();
	}
	show_debug_message($"Lexicon.Get() (with entry changed) {(get_timer() - _t) / 1000}ms");
	var _entry = LexiconUnique("Foo {0}!");
	var _t = get_timer();
	repeat(1000) {
		_entry.Get();
	}
	show_debug_message($"Lexicon.Get() (as local) {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique("Foo {0}!").Get();
		//LexiconUnqiueCacheClear();
	}
	show_debug_message($"LexiconQ.Get() {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique(choose("Foo {0}!", "Foo {value}!")).Get();
	}
	show_debug_message($"LexiconQ.Get() (with entry changed) {(get_timer() - _t) / 1000}ms");

	var _t = get_timer();
	repeat(1000) {
		LexiconEntryGetText("test.foo");
	}
	show_debug_message($"LexiconEntryGetText() {(get_timer() - _t) / 1000}ms");
}

show_debug_message("\n==========\n");

show_debug_message("String replacement speed test");
repeat(1) {
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique("Foo {0}!", 32).Get();
	}
	show_debug_message($"Lexicon.Get() {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique("Foo {0}!", 32).Get();
	}
	show_debug_message($"LexiconQ.Get() {(get_timer() - _t) / 1000}ms");
	var _entry = LexiconUnique("Foo {0}!");
	var _t = get_timer();
	repeat(1000) {
		_entry.Get(32);
	}
	show_debug_message($"Lexicon.Get() (with string template) {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique(choose("Foo {0}!", "Foo {value}!"), 32).Get();
	}
	show_debug_message($"Lexicon.Get() (with entry changed) {(get_timer() - _t) / 1000}ms");
	show_debug_message($"Lexicon.Get() {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		LexiconUnique(choose("Foo {0}!", "Foo {value}!")).Get(32);
	}
	show_debug_message($"Lexicon.Get() (with entry changed) (with string template replacement) {(get_timer() - _t) / 1000}ms");
	var _entry = LexiconUnique("Foo {0}!", 32).GetCallback();
	var _t = get_timer();
	repeat(1000) {
		_entry.Get();
	}
	show_debug_message($"Lexicon.Get() (as local) {(get_timer() - _t) / 1000}ms");

	var _entry = LexiconUnique("Foo {0}!").GetCallback();
	var _t = get_timer();
	repeat(1000) {
		_entry.Get("A");
	}
	show_debug_message($"Lexicon.Get() (as local) (with string template replacement) {(get_timer() - _t) / 1000}ms");

	var _entry = LexiconUnique("Foo {0}!");
	var _t = get_timer();
	repeat(1000) {
		_entry.Get(choose("A", "B"));
	}
	show_debug_message($"Lexicon.Get() (as local) (with string template replacement) (with changes) {(get_timer() - _t) / 1000}ms");
	value = 0;
	var _t = get_timer();
	var _entry = LexiconUnique("foo.bar");
	//var _entry = Lexicon("Foo {bar}!", id);
	//var _entry = Lexicon("Foo {0}!");
	show_debug_message($"Lexicon.Get() (as local) (with longest entry with dynamic values) {(get_timer() - _t) / 1000}ms");
	var _structs = [
		{value: 32},
		{value: 42}
	];
	var _t = get_timer();
	repeat(1000) {
		_entry.Get();
		//value = choose("A", "B");
	}
	show_debug_message($"Lexicon.Get() (as local) (with dynamic replacement) {(get_timer() - _t) / 1000}ms");	
	entry = _entry;

	var _t = get_timer();
	repeat(1000) {
		string(LexiconEntryGetText("test.foo"), 2);
	}
	show_debug_message($"LexiconEntryGetText() {(get_timer() - _t) / 1000}ms");
}

//show_debug_overlay(true, false);

//show_debug_message(Lexicon("foo.bar").Get());
//LexiconPlugInForceLoad();

show_debug_message(LexiconUnique("foo.bar").Get());
show_debug_message(LexiconUnique("rawr.uwu").Get());
show_debug_message(LexiconEntryGetVariations("rawr.uwu"));
show_debug_message(LexiconUnique("rawr.uwu0").Get());
show_debug_message(LexiconUnique("rawr.uwu1").Get());
show_debug_message(LexiconUnique("rawr.uwu2").Get());
show_debug_message(LexiconUnique("npc.alice.name").Get());
//show_debug_message(LexiconPlugInGetMetadataStruct());

LexiconIndexDeclare("English (Australia)", "en_AU", "en").SetFont("default", __LexiconFontFallback);
LexiconIndexAddFile("localization table.csv", "English (Australia)");
//LexiconIndexDeclare("English", "en");
LexiconIndexDeclare("Japanese", "ja_JP");

show_debug_message(LexiconLanguageGet("en_US", false));
show_debug_message(LexiconLanguageGets(true));
//LexiconGlobalFallbackSet("English");
LexiconIndexDeclareFromFile("english.json");
LexiconIndexDeclareFromFile("locale.csv");
LexiconIndexDeclareFromFile("test.json");
//LexiconIndexAddFile("english.json", "English", "en");
//show_debug_message(LexiconLanguageGets(true));
LexiconLanguageSet("English (Australia)");

LexiconLanguageGet("Japanese").SetRemapAsset(spr_a, spr_b);//.SetFont("text", fnt_japanese);
//entry = LexiconTxt("foo.bar");
//call_later(10, time_source_units_frames, function() {
//	show_debug_message(Lexicon("foo.bar").Get());
//	show_debug_message(Lexicon("rawr.uwu").Get());
//	show_debug_message(LexiconEntryGetVariations("rawr.uwu"));
//	show_debug_message(Lexicon("rawr.uwu0").Get());
//	show_debug_message(Lexicon("rawr.uwu1").Get());
//	show_debug_message(Lexicon("rawr.uwu2").Get());
//	show_debug_message(Lexicon("npc.alice.name").Get());
//	show_debug_message(Lexicon("Hello, world!").Get());
//	show_debug_message(LexiconPlugInGetMetadataStruct());
//}, true);

call_later(0.1, time_source_units_seconds, function() {
	LexiconLanguageSet("English (Australia)");
	var _data = {language: "English (Australia)", locale: "en_AU", text: {}};
	_data.text[$ "foo.bar2"] = SampleText();
	_data.text[$ "foo.bar3"] = SampleText2();
	_data.text[$ "testEntry"] = "That'll be {value}!… {DATETIME}…";
	_data.text[$ "foo.bar4"] = "Hello {bob {the_builder}";
	LexiconIndexLoadString(json_stringify(_data), "json");
	LexiconIndexLoadString("test.from.txt=Hello,\\nWorld!\\naaa\\naaaaa\ntest=foo=bar\n", "txt");
	var _t = get_timer();
	repeat(1000) {
		var _entry = LexiconUnique("foo.bar2");
	}
	show_debug_message($"Lexicon(\"foo.bar2\") no arguments: {(get_timer() - _t) / 1000}ms");
	//show_debug_message(_entry.Get());
	var _data = {value: 42};
	var _t = get_timer();
	repeat(1000) {

		var _entry = LexiconUnique("foo.bar2").Update(_data);
	}
	show_debug_message($"Lexicon(\"foo.bar2\") with arguments: {(get_timer() - _t) / 1000}ms");
	//show_debug_message(_entry.Get());

	var _t = get_timer();
		repeat(1) {
			Lexicon("foo.bar2");
		}
	show_debug_message($"foo.bar2: {(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
		var _entry = Lexicon("testEntry")
	show_debug_message($"{(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
		_entry.Get();
	show_debug_message($"{(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	show_debug_message(_entry.Get());
	show_debug_message($"{(get_timer() - _t) / 1000}ms");
	var _t = get_timer();
	repeat(1000) {
		_entry.Get();
	}
	show_debug_message($"{(get_timer() - _t) / 1000}ms");
}); 

call_later(4, time_source_units_seconds, function() {
	show_debug_message("Changing to Japanese!");
	LexiconLanguageSet("Japanese");
});
LexiconLanguageSet("English");
// Group test
group = LexiconGroup("multiplayer.game.status");
//show_debug_message(group.GetEntries());
var _t = get_timer();
repeat(1000) {
	group.GetStatic("start");
}
show_debug_message($"{(get_timer() - _t) / 1000}ms");
var _t = get_timer();
repeat(1000) {
	group.Get("start");
}
show_debug_message($"{(get_timer() - _t) / 1000}ms");

