// Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = fn_fontWithJapanese;
draw_set_font(font);
show_debug_overlay(true);

lexicon_index_definitions("definitions.json");
lexicon_index_declare_from_json("locale.json");
lexicon_index_declare_from_csv("locale.csv");
lexicon_index_fallback_language_set("English")

lexicon_locale_set(lexicon_get_os_locale());

struct = {playerName: "TabularElf", loveMeter: "100%", dateTime: string(date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))};
array = ["100%", "TabularElf", string( date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))];
languages_array = lexicon_languages_get_array();
language_index = 0;
incr = 0;
