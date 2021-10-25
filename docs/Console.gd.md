<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Console.gd

**Extends:** [CanvasLayer](../CanvasLayer)

## Description

## Constants Descriptions

### BaseCommands

```gdscript
const BaseCommands: GDScript = preload("res://addons/quentincaffeino/console/src/Misc/BaseCommands.gd")
```

### CommandService

```gdscript
const CommandService: GDScript = preload("res://addons/quentincaffeino/console/src/Command/CommandService.gd")
```

### DefaultActions

```gdscript
const DefaultActions: GDScript = preload("res://addons/quentincaffeino/console/DefaultActions.gd")
```

### FilterType

```gdscript
const FilterType: GDScript = preload("res://addons/quentincaffeino/console/src/Type/FilterType.gd")
```

### FloatRangeType

```gdscript
const FloatRangeType: GDScript = preload("res://addons/quentincaffeino/console/src/Type/FloatRangeType.gd")
```

### IntRangeType

```gdscript
const IntRangeType: GDScript = preload("res://addons/quentincaffeino/console/src/Type/IntRangeType.gd")
```

## Custom console types

## Property Descriptions

### History

```gdscript
var History
```

@var  History

### Log

```gdscript
var Log
```

@var  Logger

### is\_console\_shown

```gdscript
var is_console_shown
```

@var  bool

### consume\_input

```gdscript
var consume_input
```

@var  bool

### previous\_focus\_owner

```gdscript
var previous_focus_owner
```

@var  Control

### Text

```gdscript
var Text
```

### Line

```gdscript
var Line
```

## Method Descriptions

### get\_command\_service

```gdscript
func get_command_service()
```

@returns  Command/CommandService

### get\_command

```gdscript
func get_command(name)
```

@param    String  name
@returns  Command/Command|null

### find\_commands

```gdscript
func find_commands(name)
```

@param    String  name
@returns  Command/CommandCollection

### add\_command

```gdscript
func add_command(name, target, target_name = null)
```

Example usage:
```gdscript
Console.add_command('sayHello', self, 'print_hello')\
	.set_description('Prints "Hello %name%!"')\
	.add_argument('name', TYPE_STRING)\
	.register()
```
@param    String       name
@param    Reference    target
@param    String|null  target_name
@returns  Command/CommandBuilder

### remove\_command

```gdscript
func remove_command(name)
```

@param    String  name
@returns  int

### write

```gdscript
func write(message)
```

@param    String  message
@returns  void

### write\_line

```gdscript
func write_line(message = "")
```

@param    String  message
@returns  void

### clear

```gdscript
func clear()
```

@returns  void

### toggle\_console

```gdscript
func toggle_console()
```

@returns  Console

## Signals

- signal toggled(is_console_shown): @param  bool  is_console_shown
- signal command_added(name, target, target_name): @param  String       name
@param  Reference    target
@param  String|null  target_name
- signal command_removed(name): @param  String  name
- signal command_executed(command): @param  Command  command
- signal command_not_found(name): @param  String  name
