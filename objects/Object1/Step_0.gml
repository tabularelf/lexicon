if (keyboard_check_released(vk_space)) {
	LexiconUniqueClear();
}

if (keyboard_check_released(vk_control)) {
	game_restart();
}

var _entry = LexiconUnique("foo.bar2");
//var _t = get_timer();
repeat(1) {
	LexiconUnique("foo.bar2", {value: 42})
}
//show_debug_message((get_timer() - _t) / 1000);


/*
repeat(1000) {
		//Lexicon("Foo {0}!").Get();
		//_struct.value = 0;
	}

/*var _maxTime = 1000;
var _entry = Lexicon("Foo {0}!", 32);
var _t = get_timer();
var _sampleText = "foo.bar";

repeat(_maxTime) {
	Lexicon("Foo {0}!", 32);
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Foo {bar} {0}!", 32, {value: 42});
var _t = get_timer();
repeat(_maxTime) {
	Lexicon("Foo {bar} {0}!", 32, {value: 42});
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Foo {bar}!", {value: 32});
var _t = get_timer();
repeat(_maxTime) {
	Lexicon("Foo {bar}!", {value: 32});
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Foo {{bar}!", {value: 32});
var _t = get_timer();
repeat(_maxTime) {
	Lexicon("Foo {{bar}!", {value: 32});
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Hello {name}, nice to meet you! May I interest you in some {item}?", {name: "Bob", item: "Apples"});
var _t = get_timer();
repeat(_maxTime) {
	Lexicon("Hello {name}, nice to meet you! May I interest you in some {item}?", {name: "Bob", item: "Apples"});
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon(_sampleText);
var _t = get_timer();
repeat(_maxTime) {
	Lexicon(_sampleText);
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message($"Very long text fetch with no arguments - {(get_timer() - _t) / 1000}ms");

/*
var _entry = Lexicon(_sampleText, {value: 42});
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message(_entry.Get());
show_debug_message($"Very long text fetch with arguments - {(get_timer() - _t) / 1000}ms");



*/








//show_debug_message(_GMFILE_ + ":" + string(_GMLINE_));
var _str = string_repeat("{playerName}, ", 2048);
var _strResult = "Result " +  $"\{collapse, {_str} 32 \} " + $" {string_repeat("{playerName}", 2048*3)} " + string_repeat(SampleText(), 10);

var _entry = LexiconUnique(_strResult);//LexiconUnique(string_repeat(SampleText(), 500);
var _t = get_timer();
repeat(1000) {
	_entry.Get();
    //LexiconEntryGetText("Foo {superExpensiveLoop}");
}
show_debug_message($"{(get_timer() - _t) / 1000}ms");
if (LexiconPlugInExistsEntry($"{_strResult}")) {
	show_debug_message(string_length(_entry.Get()));
}