/*var _maxTime = 1000;
var _entry = Lexicon("Foo {0}!");
var _t = get_timer();
var _sampleText = "foo.bar";
var _languages = ["English", "Emglish"];
var _pos = 0;

repeat(_maxTime) {
	Lexicon("Foo {0}!").Get()	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Lexicon - {(get_timer() - _t) / 1000}ms");

/*
var _entry = Lexicon("Foo {bar} {0}!", 32, {value: 42});
var _t = get_timer();
repeat(_maxTime) {
	
	_entry.Get()	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Foo {bar}!", {value: 32});
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Foo {{bar}!", {value: 32});
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

var _entry = Lexicon("Hello {name}, nice to meet you! May I interest you in some {item}?", {name: "Bob", item: "Apples"});
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"{_entry.Get()} - {(get_timer() - _t) / 1000}ms");

/*
var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon("Hello {name}, nice to meet you! May I interest you in some {item}?", {name: "Bob", item: "Apples"});	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating most expensive entry with arguments - {(get_timer() - _t) / 1000}ms");

var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon("Hello {name}, nice to meet you! May I interest you in some {item}?");	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating most expensive entry with no arguments - {(get_timer() - _t) / 1000}ms");

var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon("Foo {0}!");	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating least expensive entry with no arguments - {(get_timer() - _t) / 1000}ms");

var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon("Foo {0}!", 32);	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating least expensive entry wtih a argument - {(get_timer() - _t) / 1000}ms");


var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon(_sampleText);	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating very long text with no arguments - {(get_timer() - _t) / 1000}ms");

var _t = get_timer();
repeat(_maxTime) {
	var _entry = Lexicon(_sampleText, {value: 42});	
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Generating very long text with arguments - {(get_timer() - _t) / 1000}ms");
*/

/*
var _entry = Lexicon(_sampleText);
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()
	//Lexicon("Foo {0}!", 32)
}
show_debug_message($"Very long text fetch with no arguments - {(get_timer() - _t) / 1000}ms");


var _entry = Lexicon(_sampleText, {value: 42});
var _t = get_timer();
repeat(_maxTime) {
	_entry.Get()
	//Lexicon("Foo {0}!", 32)
}
//show_debug_message(_entry.Get());
show_debug_message($"Very long text fetch with arguments - {(get_timer() - _t) / 1000}ms");