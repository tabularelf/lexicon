# Replace Newlines
This plug-in has no configuration options. Replace newlines is a barebones plug-in that has one job, to correct all newline characters (that being carriage return `\r` and line break `\n` respectively).
Why? Because GameMaker by default at compile time will replace all characters matching `\r` and `\n` with their newline counterparts. This means any strings that are like `"Hello\nworld!"` are converted to
```
Hello
world!
```
Any strings loaded in from files, do not exhibit this behaviour, as this is not a runtime operation, only compile time. This is where this plug-in comes in to respect how GameMaker would handle this at compile time.