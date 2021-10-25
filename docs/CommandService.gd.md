<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CommandService.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### CommandBuilder

```gdscript
const CommandBuilder: GDScript = preload("res://addons/quentincaffeino/console/src/Command/CommandBuilder.gd")
```

### CommandCollection

```gdscript
const CommandCollection: GDScript = preload("res://addons/quentincaffeino/console/src/Command/CommandCollection.gd")
```

### Iterator

```gdscript
const Iterator: GDScript = preload("res://addons/quentincaffeino/iterator/src/Iterator.gd")
```

### Result

```gdscript
const Result: GDScript = preload("res://addons/quentincaffeino/console/src/Misc/Result.gd")
```

## Method Descriptions

### \_init

```gdscript
func _init(console)
```

@param  Console  console

### values

```gdscript
func values()
```

@returns  Iterator

### create

```gdscript
func create(command_name, target, target_name = null)
```

@param    String       command_name
@param    Reference    target
@param    String|null  target_name
@returns  CommandBuilder

### set

```gdscript
func set(command_name, command)
```

@param    String   command_name
@param    Command  command
@returns  bool

### get

```gdscript
func get(command_name)
```

@param    String   command_name
@returns  Command|null

### find

```gdscript
func find(command_name)
```

@param    String   command_name
@returns  CommandCollection

### remove

```gdscript
func remove(command_name)
```

@param    String   command_name
@returns  void

### autocomplete

```gdscript
func autocomplete(command_name)
```

@param    String   command_name
@returns  String