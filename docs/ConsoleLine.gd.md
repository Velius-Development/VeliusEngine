<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ConsoleLine.gd

**Extends:** [LineEdit](../LineEdit)

## Description

## Constants Descriptions

### COMMANDS\_SEPARATOR

```gdscript
const COMMANDS_SEPARATOR: String = ";"
```

### COMMAND\_PARTS\_SEPARATOR

```gdscript
const COMMAND_PARTS_SEPARATOR: String = " "
```

### DefaultActions

```gdscript
const DefaultActions: GDScript = preload("res://addons/quentincaffeino/console/DefaultActions.gd")
```

### QUOTES

```gdscript
const QUOTES: Array = ["\"","'"]
```

### RECOMMANDS\_SEPARATOR

```gdscript
const RECOMMANDS_SEPARATOR: String = "(?<!\\\\);"
```

### RegExLib

```gdscript
const RegExLib: GDScript = preload("res://addons/quentincaffeino/regexlib/src/RegExLib.gd")
```

### SCREENERS

```gdscript
const SCREENERS: Array = ["\\/"]
```

## Method Descriptions

### set\_text

```gdscript
func set_text(text, move_caret_to_end = true)
```

@param    String  text
@param    bool    move_caret_to_end
@returns  void

### execute

```gdscript
func execute(input)
```

@param    String  input
@returns  void