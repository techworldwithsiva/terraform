### Count
Count is useful to create more resources with single code block. count.index is a special variable you will get if you use count parameter.

If you have
```
count = 0
```
then terraform will not create the resource

### Expressions

Expression are like if condition.
```
condition ? "if true this will run" : "if false this will run"
```

### locals
Locals is almost like variables, but a simple difference is

* It can run expressions and functions inside it. 
* You can save intermediate values in locals and use it wherever you require

```
locals{
    key = value
}
```
you can refer using
```
local.key
```