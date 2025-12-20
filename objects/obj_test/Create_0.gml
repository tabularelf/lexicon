randomize();

LexiconGlobalFallbackSet("en");
LexiconIndexDeclare("English", "en");

LexiconIndexDeclare("Australian English", "en_AU");
LexiconIndexDeclareFromFile("english.json");
LexiconIndexDeclareFromFile("locale.csv")


LexiconIndexDeclare("Portuguese", "pt");
LexiconIndexDeclare("Brazilian Portuguese", "pt_BR", "pt");

var _locale = LexiconGetOSLocale();
LexiconLanguageSet("en_AU");

var _globals = LexiconGlobalStructGet();
_globals.foo = {};
_globals.foo.bar = {};
_globals.foo.bar.rawr = {};
_globals.foo.bar.rawr.uwu = 42;
_globals.bar = Lexicon("item");

state = 0;
variation_index = 0;
keyboard_string = "Alice";

playerData = {
	money: 0.00005,
};

priceData = {
	applePrice: 2,
};

languages = [
	"en_AU",
	"pt_BR",
];

langIndex = 0;

text = Lexicon("start.select_name");
datetime = Lexicon("datetime");

show_debug_message(LexiconParse("Hello {GLOBAL.foo.bar.rawr.uwu}!"));

show_debug_message(Lexicon("copyright", $"2020 - {current_year}", 124));

LexiconGSDeclare("localize_google.csv", "1xw6tkRO5CEa9gkzopOG0dYQgKBJMu9d9bbu6dFZllO8", "660060738");