/// @description Insert description here
// You can write your code in this editor
lexicon_init("en-US");
var _buff = buffer_load("locale.json");
lexicon_parse_json(_buff);
buffer_delete(_buff);

var _buff = buffer_load("locale.csv");
var _string = buffer_read(_buff,buffer_text);
lexicon_parse_csv(_string);
buffer_delete(_buff);
show_debug_overlay(true);

array = [];
var _i = 0;
repeat(100) {
	array[_i++] = _i;
}