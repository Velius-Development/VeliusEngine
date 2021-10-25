<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Command.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### Argument

```gdscript
const Argument: GDScript = preload("res://addons/quentincaffeino/console/src/Argument/Argument.gd")
```

## Method Descriptions

### \_init

```gdscript
func _init(name, target, arguments, description = null)
```

@param  String       name
@param  Callback     target
@param  Argument[]   arguments
@param  String|null  description

### get\_name

```gdscript
func get_name()
```

@returns  String

### get\_target

```gdscript
func get_target()
```

@returns  Callback

### get\_arguments

```gdscript
func get_arguments()
```

@returns  Argument[]

### get\_description

```gdscript
func get_description()
```

@returns  String|null

### execute

```gdscript
func execute(inArgs)
```

@param    Array  inArgs
@returns  Variant

### describe

```gdscript
func describe()
```

@returns  void