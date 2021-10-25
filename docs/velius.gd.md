<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# velius.gd

**Extends:** [Node](../Node)

## Description

## Property Descriptions

### next

```gdscript
var next
```

- **Setter**: `set_next`

#############################
VARIABLES:
Contains the current dialogue

### json\_data

```gdscript
var json_data
```

### current\_json\_path

```gdscript
var current_json_path
```

### current\_json\_location

```gdscript
var current_json_location
```

### current\_chapter\_id

```gdscript
var current_chapter_id: int
```

### current\_dialogue\_id

```gdscript
var current_dialogue_id: int
```

### current\_location\_id

```gdscript
var current_location_id: int
```

## Method Descriptions

### set\_next

```gdscript
func set_next(new_next: Dictionary) -> void
```

#############################
SET/GET-TERS

### get\_dialogue\_by\_id

```gdscript
func get_dialogue_by_id(id: int) -> Dictionary
```

#############################
TODO: FIND TITLE
Returns Dictionary containing
the dialogue's data
If id not found: returns empty Dictionary

### get\_action

```gdscript
func get_action(id: int) -> String
```

Returns a choice's action string

### start\_chapter

```gdscript
func start_chapter(json_path: String, chapterID: int) -> var
```

#########################################
## MESSAGE SYSTEM
Loads a Mystery's data and theme
After loading the given chapter will get displayed

### run\_dialogue

```gdscript
func run_dialogue(data: Dictionary) -> void
```

Runs a dialogue with the given data
Replaces all '@'-variables with their string value

### run\_location

```gdscript
func run_location(l: Dictionary) -> void
```

Run location view
TODO: Implement

### go\_next

```gdscript
func go_next() -> void
```

Jumps to the next dialogue
TODO: Implement

### end

```gdscript
func end() -> void
```

Ends the mystery processing

### go

```gdscript
func go(id: int) -> void
```

##############################################################################
API
##############################################################################
Go to current chapter's dialogue with given id

### go\_chapter

```gdscript
func go_chapter(chapter_id: int, dialogue_id = 0) -> void
```

Switches to chapter with given id
and directly jumps to given dialogue_id

### choice\_made

```gdscript
func choice_made(id: int) -> void
```

Called when player made a choice
Runs the selected choice's script

### open\_side\_menu

```gdscript
func open_side_menu() -> void
```

Opens the side menu

### get\_mystery\_resource\_path

```gdscript
func get_mystery_resource_path(relative_path: String) -> String
```

Returns a mystery resources full virtual path

### mystery\_resource\_exists

```gdscript
func mystery_resource_exists(relative_path: String) -> bool
```

Returns if a mystery resource exists

### png\_to\_tex

```gdscript
func png_to_tex(local_res_path: String) -> ImageTexture
```

Returns ImageTexture of a given local png path

### import

```gdscript
func import(path = "all", dlc = false)
```

Imports the mystery package located at the given path
If path is not given all packages get imported that are
located at user://DLC
The dlc parameter determines if the packages is displayed
in the dlc or the debug category
If no arguments are given, all DLC in user://DLC get
imported as DLC

### erase\_from

```gdscript
func erase_from(dict: Dictionary, from: Dictionary) -> Dictionary
```

Removes a dictionary's object from a dictionary
Only works on the first layer (non-recursive)

### get\_key\_by\_from

```gdscript
func get_key_by_from(dict: Dictionary, from: Dictionary) -> String
```

Returns the key of a object with in a dictionary that eqals the 'from' dictioanry

### evaluate\_value

```gdscript
func evaluate_value(input: String)
```

Returns a given string value in its type

## Signals

- signal new_dialogue(data): ##############################################################################
                                 VELIUS ENGINE                              #
##############################################################################
#############################
SIGNALS:
Called when a new dialogue is fired
Returns a Dictionary
