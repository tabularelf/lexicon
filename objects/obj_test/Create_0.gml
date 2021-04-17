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

array[1000] = 0;
var _i = 0;
repeat(1000) {
	array[_i++] = _i;
}
text = lexicon_text_array("text.test",array);
lexicon_add_entry("en-US", "text.test2", "This is a test with my name : {{playerName}}, and my level {{level}}.");
struct = {playerName: "TestSubject", level: current_time};