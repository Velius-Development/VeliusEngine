<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Collection.gd

## Constants Descriptions

### Iterator

```gdscript
const Iterator: GDScript = preload("res://addons/quentincaffeino/iterator/src/Iterator.gd")
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
func _init(collection)
```

@param  Variant  collection

### replace\_collection

```gdscript
func replace_collection(collection)
```

@param    Variant  collection
@returns  void

### set

```gdscript
func set(key, value)
```

Adds/sets an element in the collection at the index / with the specified key.
@param    Variant  key
@param    Variant  value
@returns  void

### add

```gdscript
func add(value)
```

Adds an element to the collection.
@param    Variant  value
@returns  void

### remove

```gdscript
func remove(key)
```

Removes an element with a specific key/index from the collection.
@param    Variant  key
@returns  void

### remove\_element

```gdscript
func remove_element(element)
```

Removes the specified element from the collection, if it is found.
@param    Variant  element
@returns  bool

### remove\_by\_index

```gdscript
func remove_by_index(index)
```

@param    int  index
@returns  void

### contains\_key

```gdscript
func contains_key(key)
```

Checks whether the collection contains a specific key/index.
@param    Variant  key
@returns  bool

### contains

```gdscript
func contains(element)
```

Checks whether the given element is contained in the collection.
Only element values are compared, not keys. The comparison of
two elements is strict, that means not only the value but also
the type must match. For objects this means reference equality.
@param    Variant  element
@returns  bool

### index\_of

```gdscript
func index_of(element)
```

Searches for a given element and, if found, returns the corresponding
key/index of that element. The comparison of two elements is strict,
that means not only the value but also the type must match.
For objects this means reference equality.
@param    Variant  element
@returns  Variant|null

### get

```gdscript
func get(key)
```

Gets the element with the given key/index.
@param    Variant  key
@returns  Variant|null

### get\_by\_index

```gdscript
func get_by_index(index)
```

@param    int  index
@returns  Variant|null

### get\_keys

```gdscript
func get_keys()
```

Gets all keys/indexes of the collection elements.
@returns  Variant[]

### get\_values

```gdscript
func get_values()
```

Gets all elements.
@returns  Variant[]

### is\_empty

```gdscript
func is_empty()
```

Checks whether the collection is empty.
@returns  bool

### clear

```gdscript
func clear()
```

Clears the collection.
@returns  void

### slice

```gdscript
func slice(offset, length = null)
```

Extract a slice of `length` elements starting at
position `offset` from the Collection.
@param    int       offset
@param    int|null  length
@returns  Collection

### fill

```gdscript
func fill(value = null, startIndex = 0, length = null)
```

Fill an array with values.
@param    Variant   value
@param    int       startIndex
@param    int|null  length
@returns  Collection

### map

```gdscript
func map(callback)
```

@param    AbstractCallback  callback
@returns  Collection

### filter

```gdscript
func filter(callback = null)
```

@param    AbstractCallback|null  callback
@returns  Collection

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

### get\_collection

```gdscript
func get_collection()
```

@returns  Variant

### length

```gdscript
func length()
```

@returns  int

### size

```gdscript
func size()
```

@returns  int

### get\_value\_iterator

```gdscript
func get_value_iterator()
```

@returns  Iterator