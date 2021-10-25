<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CommandBuilder.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### ArgumentFactory

```gdscript
const ArgumentFactory: GDScript = preload("res://addons/quentincaffeino/console/src/Argument/ArgumentFactory.gd")
```

### Callback

```gdscript
const Callback: GDScript = preload("res://addons/quentincaffeino/callback/src/Callback.gd")
```

### CallbackBuilder

```gdscript
const CallbackBuilder: GDScript = preload("res://addons/quentincaffeino/callback/src/CallbackBuilder.gd")
```

### Command

```gdscript
const Command: GDScript = preload("res://addons/quentincaffeino/console/src/Command/Command.gd")
```

## Method Descriptions

### \_init

```gdscript
func _init(console, command_service, name, target, target_name = null)
```

@param  Console         console
@param  CommandService  command_service
@param  String          name
@param  Reference       target
@param  String|null     target_name

### add\_argument

```gdscript
func add_argument(name, type = null, description = null)
```

@param    String         name
@param    BaseType|null  type
@param    String|null    description
@returns  CommandBuilder

### set\_description

```gdscript
func set_description(description = null)
```

@param    String|null  description
@returns  CommandBuilder

### register

```gdscript
func register()
```

@returns  void