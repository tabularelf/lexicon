// Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = fn_fontWithJapanese;
draw_set_font(font);
show_debug_overlay(true);

lexicon_index_definitions("definitions.json");
lexicon_index_declare_from_json("locale.json");
lexicon_index_declare_from_csv("locale.csv");
lexicon_index_fallback_language_set("English")
latestTime = 0;
lexicon_locale_set(lexicon_get_os_locale());
struct = {playerName: "TabularElf", loveMeter: "100%", dateTime: string(date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))};
array = [struct, 100, 100];
languages_array = lexicon_languages_get_array();
language_index = 0;
incr = 0;
loveMeter = 100;



lexicon_dynamic_define("loveMeter", function(_min = 0, _max = 100) {
	return string((real(_min) / real(_max)) * 100) + "%";
});

// Cache removal test (via GC)
lexicon_text("{loveMeter, 100, 200}");

var _str = "The quick brown fox jumps over the lazy dog";

show_debug_message(lexicon_text_get_utf8_range(_str));
show_debug_message(lexicon_text_get_utf8_array(_str));