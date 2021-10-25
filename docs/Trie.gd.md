<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Trie.gd

**Extends:** [Reference](../Reference)

## Description

## Method Descriptions

### insert

```gdscript
func insert(key, value)
```

If not present, inserts key into trie.
If the key is prefix of trie node, just marks leaf node.
@param    String   key
@param    Variant  value
@returns  void

### has

```gdscript
func has(key)
```

Search key in the trie.
Returns true if key presents in trie, else false.
@param    String  key
@returns  bool

### get

```gdscript
func get(key)
```

Search key in the trie.
Returns value if key presents in trie, else null.
@param    String  key
@returns  Variant|null

## Sub\-classes

### TrieNode

#### Property Descriptions

### value

```gdscript
var value
```

@var  Variant|null

#### Method Descriptions

### get\_children

```gdscript
func get_children()
```

@returns  Dictionary

### has\_child

```gdscript
func has_child(index)
```

@param    int  index
@returns  bool

### get\_child

```gdscript
func get_child(index)
```

@param    int  index
@returns  Dictionary

### initialize\_child\_at

```gdscript
func initialize_child_at(index)
```

@param    int       index
@returns  void