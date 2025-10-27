## Installing
1. Download Lexicons's .yymp from [releases!](https://github.com/tabularelf/lexicon/releases)
2. With your GameMaker Project, drag the .yymp (or at the top goto Tools -> Import Local Package)
3. Press "Add All" and press "Import".

## Updating to a new version
?> If you've made changes to `__LexiconConfig`, consider backing it up (preferably with source control) before updating!

!> If you are updating from v3 or earlier to v4, please consider reading [Changes from v3](changes-from-v3.md) and looking at [v3 equivalent](v3-equivalent.md).

1. Delete `Lexicon`'s folder (with all scripts inside.)
2. Follow the steps through [Installing](#installing), but with the latest version.
3. Reimport your `lexicon_settings` (if changes were made)

## Using Lexicon
Once added to your project, Lexicon will automatically initialise its core functionality when you run the game.
Lexicon requires your language files to be in either JSON or CSV format. 

The format of these files are as follows (and all of these are interchangeable):

<!-- tabs:start -->

#### **JSON A**

```json
{
	"language": "English",
	"locale": "en-US",
	"text": {
		"dialogue.NPCBob.Greeting": "Hello there {player}!",
		"dialogue.NPCBob.Goodbye": "Goodbye {player}!"
	}
}
```

#### **JSON B**

```json
{
	"language": "English",
	"locale": ["en-US", "en-AU"],
	"fallback": ["en"],
	"text": {
		"dialogue.NPCBob.Greeting": "Hello there {player}!",
		"dialogue.NPCBob.Goodbye": "Goodbye {player}!"
	}
}
```

#### **JSON C**

```json
{
	"language": "English",
	"locale": "en-US",
	"fallback": "en",
	"text": {
		"dialogue": {
			"NPCBob": {
				"Greeting": "Hello there {player}!",
				"Goodbye": "Goodbye {player}!"
			}
		}
	}
}
```

<!-- tabs:end -->

CSV:

| Language | Comments | English | French |
|------|------|------|------|
| Locale | Anything under here won't be declared. | en-US, en-AU | fr-fR |
| Fallback | | en | fr |
| dialogue.NPCBob.Greeting |  | Hello there {player}! | TextB |
| ------------------ | This cell is forcefully ignored as of [`__LEXICON_CSV_ROW_SEPERATOR`](csv-config.md | |
| dialogue.NPCBob.Goodbye | | Goodbye {player}! | TextD |

Lexicon will assign all locales in an array to the same Language Name. 

!> Rows A1 through A3 may be named whatever you like.

Once you have your language files created, you can set it up as one of two ways.

<!-- tabs:start -->

### **Declaring languages directly from files**

Note: These will add additional files if the language is already declared.

```gml
// i.e. LexiconIndexDeclareFromFile("english.json");
LexiconIndexDeclareFromFile("english.json");
```


```gml
// Which will declare multiple languages within the CSV.
// i.e. LexiconIndexDeclareFromFile("locale.csv");
LexiconIndexDeclareFromFile("locale.csv");
```

### **Declaring languages manually**

```gml
// To declare a language
// i.e. LexiconIndexDeclare("English", "en_US");
LexiconIndexDeclare("English", "en_US");
```

```gml
// To add JSON
// i.e. LexiconIndexAddFile("english.json", "en_-_US")
// i.e. LexiconIndexAddFile("english.json", "English")
LexiconIndexAddFile("english.json", "en_US");
```

```gml
// To add CSV
// i.e. LexiconIndexAddFile("locale.csv", "en_US");
// i.e. LexiconIndexAddFile("locale.csv", "English");
LexiconIndexAddFile("locale.csv", "en_US");
```

<!-- tabs:end -->

```gml
// Set Language
LexiconLanguageSet("English");
// Set Language by locale
LexiconLanguageSet("en_US");
```


As for fetching text, you just need to do.
```gml
// Create Event
// i.e. Lexicon("game.intro.text");
text = Lexicon("text.entry");

// Draw Event
draw_text(8, 8, text.Get());
```

You can see more examples of [`Lexicon()`](general.md) and Lexicon text elements various methods [here](text-elements-methods.md).