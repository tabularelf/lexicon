/// @description Insert description here
// You can write your code in this editor

//Need a font supporting weird glyph (from an roman alphabet user's point of view ;) )
font = FontWithJapanese

lexicon_init("en-US");
var _buff = buffer_load("locale.json");
lexicon_parse_json(_buff);
buffer_delete(_buff);

var _buff = buffer_load("locale.csv");
var _string = buffer_read(_buff,buffer_text);
lexicon_parse_csv(_string);
buffer_delete(_buff);