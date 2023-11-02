## Installing
1. Download Lexicons's .yymp from [releases!](https://github.com/tabularelf/lexicon/releases)
2. With your GameMaker Project, drag the .yymp (or at the top goto Tools -> Import Local Package)
3. Press "Add All" and press "Import".

## Updating to a new version
?> If you've made changes to `lexicon_settings`, consider backing it up (preferably with source control) before updating!

1. Delete `Lexicon`'s folder (with all scripts inside.)
2. Follow the steps through [Installing](#installing), but with the latest version.
3. Reimport your `lexicon_settings` (if changes were made)

## Using Lexicon
Once added to your project, Lexicon will automatically initialise its core functionality when you run the game.
Lexicon requires your language files to be in either JSON or CSV format. 

The format of these files are as follows:

<!-- tabs:start -->

#### **JSON A**

```json
{
	"language": "English",
	"locale": "en-US",
	"text": {
		"dialogue.NPCBob.Greeting": "Hello there %player%!",
		"dialogue.NPCBob.Goodbye": "Goodbye %player%!"
	}
}
```

#### **JSON B**

```json
{
	"language": "English",
	"locale": ["en-US", "en-AU"],
	"text": {
		"dialogue.NPCBob.Greeting": "Hello there %player%!",
		"dialogue.NPCBob.Goodbye": "Goodbye %player%!"
	}
}
```

#### **JSON C**

```json
{
	"language": "English",
	"locale": "en-US",
	"text": {
		"dialogue": {
			"NPCBob": {
				"Greeting": "Hello there %player%!",
				"Goodbye": "Goodbye %player%!"
			}
		}
	}
}
```

<!-- tabs:end -->

CSV:

| Language | Comments | English | French |
|------|------|------|------|
| Locale |  | ["en-US", "en-AU"] |  |
| dialogue.NPCBob.Greeting | Anything under here won't be declared. | Hello there %player%! | TextB |
| ------------------ | This cell is forcefully ignored as of [`LEXICON_ROW_SEPERATOR`](configuration.md) | |
| dialogue.NPCBob.Goodbye | | Goodbye %player%! | TextD |

Lexicon will assign all locales in an array to the same Language Name. 

Once you have your language files created, you can set it up as one of three ways.

<!-- tabs:start -->

### **The old way**

```gml
// To declare a language
// i.e. lexicon_index_declare("English", "en-US");
lexicon_index_declare("English", "en-US");
```

```gml
// To add JSON
// i.e. lexicon_index_add_json("en-US", "english.json")
// i.e. lexicon_index_add_json("English", "english.json")
lexicon_index_add_json("en-US", "english.json")
```

```gml
// To add CSV
// i.e. lexicon_index_add_csv("en-US", "locale.csv");
// i.e. lexicon_index_add_csv("English", "locale.csv");
lexicon_index_add_csv("en-US", "locale.csv");
```

### **The new way**

Note: These will add additional files if the language is already declared.

```gml
// i.e. lexicon_index_declare_from_json("english.json");
lexicon_index_declare_from_json("english.json");
```


```gml
// Which will declare multiple languages within the CSV.
// i.e. lexicon_index_declare_from_csv("locale.csv");
lexicon_index_declare_from_csv("locale.csv");
```

### **Definitions File**

[Click here](definitions.md) for more on how the definitions format works.

```gml
lexicon_index_definitions("definitions.json");
```

<!-- tabs:end -->

```gml
// Set Language
lexicon_language_set("English");
```


As for fetching text, you just need to do.
```gml
// For fetching text
// i.e. lexicon_text("game_intro_text");
var _text = lexicon_text("dialogue.NPCBob.Greeting");
```

You can see more examples of [`lexicon_text()`](text.md) and it's other functions.
