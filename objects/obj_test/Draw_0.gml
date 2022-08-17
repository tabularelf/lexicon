/// @description Draw event
// Feather ignore all
draw_set_font(fn_fontWithJapanese);
draw_text(32,32,"Normal Version: " + lexicon_text_array("text.test",array));
draw_text(32,64,"Struct Version: " + lexicon_text_struct("text.test2",struct));
draw_text(32,96,"Struct Version: " + lexicon_text_struct("generic.foo",struct));
draw_text(32,160,languages_array);
draw_text(32,192,lexicon_locale_get());

draw_text(room_width div 2, room_height div 2, "Press spacebar to cycle languages");