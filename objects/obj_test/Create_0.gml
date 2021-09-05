/// @description Insert description here
// You can write your code in this editor

//Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = fn_fontWithJapanese;

lexicon_index_declare("English", "en-US");
lexicon_index_add_json("English", "locale.json");
/*var _buff = buffer_load("locale.json");
lexicon_parse_json(_buff);
show_debug_message(LEXICON_STRUCT);
buffer_delete(_buff);*/
/*var _t = get_timer();
var _buff = buffer_load("locale.csv");
lexicon_parse_csv(buffer_read(_buff, buffer_text));
show_debug_message(string((get_timer() - _t) / 1000) + "ms");
buffer_delete(_buff);*/

struct = {playerName: "TabularElf", loveMeter: "100%", dateTime: string(date_get_year(date_current_datetime()))+"//"+string(date_get_month(date_current_datetime()))};

languages_array = lexicon_get_languages();
language_index = 0;