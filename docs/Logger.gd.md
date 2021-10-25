<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Logger.gd

**Extends:** [Reference](../Reference)

## Description

## Enumerations

### TYPE

```gdscript
const TYPE: Dictionary = {"DEBUG":0,"ERROR":3,"INFO":1,"NONE":4,"WARNING":2}
```

## Property Descriptions

### logLevel

```gdscript
var logLevel
```

@var  int

## Method Descriptions

### set\_log\_level

```gdscript
func set_log_level(in_log_level)
```

@param    int  in_log_level
@returns  Log

### log

```gdscript
func log(message, type)
```

Example usage:
```gdscript
Console.Log.log("Hello world!", Console.Log.TYPE.INFO)
```

@param    String  message
@param    int     type
@returns  Log

### debug

```gdscript
func debug(message)
```

@param    String  message
@returns  Log

### info

```gdscript
func info(message)
```

@param    String  message
@returns  Log

### warn

```gdscript
func warn(message)
```

@param    String  message
@returns  Log

### error

```gdscript
func error(message)
```

@param    String  message
@returns  Log