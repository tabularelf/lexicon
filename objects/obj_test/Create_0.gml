/// @description Insert description here
// You can write your code in this editor

//Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = fn_fontWithJapanese;

var _buff = buffer_load("locale.json");
lexicon_parse_json(_buff);
buffer_delete(_buff);

var _buff = buffer_load("locale.csv");
lexicon_parse_csv(_buff);
buffer_delete(_buff);

struct = {playerName: "TabularElf", loveMeter: "100%", dateTime: string(date_get_year(date_current_datetime()))+"//"+string(date_get_month(date_current_datetime()))};

languages_array = lexicon_get_languages();
language_index = 0;