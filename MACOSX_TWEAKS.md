# Make Home & End keys behave like Windows on Mac OS X

This remapping does the following in most Mac apps - including Chrome (some apps manage their key handling directly):

Home and End will go to start and end of line
ShiftHome and ShiftEnd will select to start and end of line
CtrlHome and CtrlEnd will go to start and end of document
ShiftCtrlHome and ShiftCtrlEnd will select to start and end of document

open a new file, (you may have to create the keybindings folder)


`vim ~/Library/KeyBindings/DefaultKeyBinding.dict`

paste this mapping

```
{
  "\UF729"  = moveToBeginningOfParagraph:; // home
  "\UF72B"  = moveToEndOfParagraph:; // end
  "$\UF729" = moveToBeginningOfParagraphAndModifySelection:; // shift-home
  "$\UF72B" = moveToEndOfParagraphAndModifySelection:; // shift-end
  "^\UF729" = moveToBeginningOfDocument:; // ctrl-home
  "^\UF72B" = moveToEndOfDocument:; // ctrl-end
  "^$\UF729" = moveToBeginningOfDocumentAndModifySelection:; // ctrl-shift-home
  "^$\UF72B" = moveToEndOfDocumentAndModifySelection:; // ctrl-shift-end
  "^x"  = "cut:";                                              /* Ctrl + X  */
  "^v"  = "paste:";                                            /* Ctrl + V */
  "^c"  = "copy:";                                             /* Ctrl + C */
  "^z"  = "undo:";                                             /* Ctrl + Z */
}
```

then finally restart finder

`killall Finder`
