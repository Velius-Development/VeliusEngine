<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# scene\_handler.gd

**Extends:** [Control](../Control)

## Description

## Enumerations

### TRANSITIONS

```gdscript
const TRANSITIONS: Dictionary = {"FADE_ZOOM":3,"NONE":0,"TO_LEFT":1,"TO_RIGHT":2}
```

## Constants Descriptions

### PATH\_OBJECTS

```gdscript
const PATH_OBJECTS: String = "res://src/ui/pages/page_objects/"
```

### SCENE\_PAGE

```gdscript
const SCENE_PAGE: PackedScene = preload("res://src/ui/pages/page.tscn")
```

### SCENE\_SIDEMENU

```gdscript
const SCENE_SIDEMENU: PackedScene = preload("res://src/ui/pages/side_menu/side_menu.tscn")
```

## Property Descriptions

### tween

```gdscript
var tween
```

### scene\_history

```gdscript
var scene_history: Array
```

### last\_scene

```gdscript
var last_scene
```

### current\_scene

```gdscript
var current_scene
```

### allowed\_back

```gdscript
var allowed_back: bool
```

### dialogue\_view

```gdscript
var dialogue_view
```

## Method Descriptions

### go\_last

```gdscript
func go_last(transition)
```

### open\_dialogue\_view

```gdscript
func open_dialogue_view(path: String, transition)
```

### open

```gdscript
func open(path: String, transition, allow_back = true)
```

### open\_side\_menu

```gdscript
func open_side_menu()
```

### start\_tween

```gdscript
func start_tween(transition)
```

Animations