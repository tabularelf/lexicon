/// @description Insert description here
// You can write your code in this editor

//Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = fn_fontWithJapanese;
draw_set_font(font);

/*buff = buffer_create(1, buffer_grow, 1);
buffer_write(buff, buffer_text, "Hello World!");
cbuff = buffer_compress(buff, 0, buffer_get_size(buff));
show_message(buffer_read(cbuff, buffer_u8) == 0x78);
show_message(buffer_read(cbuff, buffer_u8) == 0x9c);*/

//lexicon_index_definitions("definitions.json");
lexicon_index_declare_from_csv("locale.csv");
lexicon_index_declare_from_json("locale.json");

lexicon_locale_set(lexicon_get_os_locale());

struct = {playerName: "TabularElf", loveMeter: "100%", dateTime: string(date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))};
array = ["100%", "TabularElf", string( date_get_year(date_current_datetime()))+"/"+string(date_get_month(date_current_datetime()))];
languages_array = lexicon_languages_get_array();
language_index = 0;




