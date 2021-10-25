<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ArgumentFactory.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### Argument

```gdscript
const Argument: GDScript = preload("res://addons/quentincaffeino/console/src/Argument/Argument.gd")
```

### BaseType

```gdscript
const BaseType: GDScript = preload("res://addons/quentincaffeino/console/src/Type/BaseType.gd")
```

### Error

```gdscript
const Error: GDScript = preload("res://addons/quentincaffeino/console/src/Misc/Error.gd")
```

### FALLBACK\_ERROR

```gdscript
const FALLBACK_ERROR: String = "73ca5439-fd62-442f-8a33-73135dbf5469"
```

### Result

```gdscript
const Result: GDScript = preload("res://addons/quentincaffeino/console/src/Misc/Result.gd")
```

### TypeFactory

```gdscript
const TypeFactory: GDScript = preload("res://addons/quentincaffeino/console/src/Type/TypeFactory.gd")
```

## Method Descriptions

### create <small>(static)</small>

```gdscript
func create(name, type = 0, description = null)
```

@param    String        name
@param    int|BaseType  type
@param    String|null   description
@returns  Result