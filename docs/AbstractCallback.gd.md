<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# AbstractCallback.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

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
func _init(target, type)
```

@param  Reference   target
@param  Utils.Type  type

### get\_target

```gdscript
func get_target()
```

@returns  Reference

### get\_type

```gdscript
func get_type()
```

@returns  int

### ensure

```gdscript
func ensure()
```

Ensure callback target exists
@returns  boolean

### bind

```gdscript
func bind(argv)
```

@param  Variant[]  argv
@returns  void

### call

```gdscript
func call(argv)
```

@param  Variant[]  argv
@returns  Variant