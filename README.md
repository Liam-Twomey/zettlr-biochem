## Goal
Zettlr is set up for use in a broad range of academic fields, and I've found it necessary to customize a bunch of the default settings, including the export settings and a large autocorrect and (smaller) snippet library.

My hope is that this helps other chemists and biochemists to get started with Zettlr settings. To use, follow the Zettlr [instructions](https://docs.zettlr.com/en/reference/migrating/) for migrating computers. Only replace these files on a fresh install, before you've modified them! Otherwise, you'll have to figure out how to merge files properly.

## Contents
- `autocorrect.json` - an extended list of autocorrects to allow insertion of UniCode greek letters and symbols.
- `custom.css` - Lightens the dark background of the Zettlr dark mode to make chemical structures with transparent backgrounds easier to read.
- `LaTeX-chem.yaml` - A zettlr/pandoc export formula to generate LaTeX files from zettlr with reasonable defaults for a chemical manuscript or notebook. 
- `LuaTeX-Chem-PDF.yaml` - A zettlr/pandoc export formula to generate PDFs from Zettlr files; will work with the UniCode characters inserted by the `autocorrect.json` file.
- `pdfTeX-Chem-PDF.yaml` - a faster PDF export formula, but will not format directly inserted unicode characters (as used by `autocorrects.json`) properly.  
- `snippets`
  - `ce.tpl.md` - allows use of `:ce:` to create a LaTeX chemequation block to properly format chemical formulas and equations.
  - `titleblock.tpl.md` - inserts a titleblock which can be tabbed through. 
- `update-config-bkp.sh` - A bash script to back up zettlr config files (tested on linux). Run script with no commands for usage.

## Usage
The `.yaml` export files can be dragged and dropped into `/.config/Zettlr/defaults`, but the contents of `autocorrect.json` should be pasted into the `autocorrect{...}` section of config.json.
