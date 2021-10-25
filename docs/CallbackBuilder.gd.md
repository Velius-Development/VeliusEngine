<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CallbackBuilder.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### Callback

```gdscript
const Callback: GDScript = preload("res://addons/quentincaffeino/callback/src/Callback.gd")
```

### FuncRefCallback

```gdscript
const FuncRefCallback: GDScript = preload("res://addons/quentincaffeino/callback/src/FuncRefCallback.gd")
```

### Utils

```gdscript
const Utils: GDScript = preload("res://addons/quentincaffeino/callback/src/Utils.gd")
```

### errors

```gdscript
const errors: Dictionary = {"qc.callback.call.ensure_failed":"qc/callback: call: Failed to call a callback, ensuring failed. (%s, %s)","qc.callback.call.unknown_type":"qc/callback: call: Unable to call unknown type. (%s, %s)","qc.callback.canCreate.first_arg":"qc/callback: canCreate: First argument must be target object. Provided: %s.","qc.callback.canCreate.second_arg":"qc/callback: canCreate: Second argument must be variable or method name (string). Provided: %s.","qc.callback.ensure.target_destroyed":"qc/callback: ensure: Failed to call a callback, target was previously destroyed. (%s)","qc.callback.target_missing_mv":"qc/callback: ensure: Target is missing method/variable. (%s, %s)"}
```

## Method Descriptions

### \_init

```gdscript
func _init(target)
```

@param  Reference  target

### set\_name

```gdscript
func set_name(name)
```

@param    String  name
@returns  CallbackBuilder

### get\_name

```gdscript
func get_name()
```

@returns  String

### set\_variable

```gdscript
func set_variable(name)
```

@param    String  name
@returns  CallbackBuilder

### set\_method

```gdscript
func set_method(name)
```

@param    String  name
@returns  CallbackBuilder

### set\_type

```gdscript
func set_type(type)
```

@param    int  type
@returns  CallbackBuilder

### get\_type

```gdscript
func get_type()
```

@returns  int

### bind

```gdscript
func bind(argv)
```

@param    Variant[]  argv
@returns  CallbackBuilder

### build

```gdscript
func build()
```

@returns  Callback|null