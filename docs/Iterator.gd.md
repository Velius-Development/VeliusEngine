<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Iterator.gd

**Extends:** [Reference](../Reference)

## Description

## Constants Descriptions

### CallbackBuilder

```gdscript
const CallbackBuilder: GDScript = preload("res://addons/quentincaffeino/callback/src/CallbackBuilder.gd")
```

## Property Descriptions

### length

```gdscript
var length
```

- **Getter**: `length`

@var  int

## Method Descriptions

### \_init

```gdscript
func _init(target, get_value_field = "get", get_length_field = "size")
```

@param  Reference  target
@param  String     get_value_field
@param  String     get_length_field

### length

```gdscript
func length()
```

@returns  int

### first

```gdscript
func first()
```

Sets the internal iterator to the first element in the collection and returns this element.
@returns  Variant|null

### last

```gdscript
func last()
```

Sets the internal iterator to the last element in the collection and returns this element.
@returns  Variant|null

### key

```gdscript
func key()
```

Gets the current key/index at the current internal iterator position.
@returns  Variant|null

### next

```gdscript
func next()
```

Moves the internal iterator position to the next element and returns this element.
@returns  Variant|null

### previous

```gdscript
func previous()
```

Moves the internal iterator position to the previous element and returns this element.
@returns  Variant|null

### current

```gdscript
func current()
```

Gets the element of the collection at the current internal iterator position.
@returns  Variant|null