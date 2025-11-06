# Text Entries

In other localisation systems, and in previous versions of Lexicon, text entries are usually stored in a database with a key:pair, where the key is the localisation entry and the pair being the entry (usually a string).

In GameMaker, this is traditionally
```gml
global.lc = {};
global.lc[$ "npc.bob.greeting"] = "Hello, Alice!";
```

Lexicon takes a slightly different approach, and instead stores every single text entry as its own lightweight object. This is for a couple of different reasons, the most prominent being that every single text entry now tracks which language is it set from. This gives overall greater control in how Lexicon handles text elements updates, giving you less things to handle.

# Text Parsing
All of the parsers in Lexicon by default are using `LexiconPlugInAddEntry(...)`, to ensure that only non-existing text entries are dealt with. Leaving duplicates in other file/s (or even with diverting paths) to be ignored. This is especially important when it comes to fallback languages, as you do not want a fallback language to override your main language entries.