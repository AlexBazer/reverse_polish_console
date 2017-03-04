## Reverse polish notation calculator console application

### Usage

```
main.rb [options] expressions_file
    -u, --uri [URI]                  URI to reverse polish notation API
```
By default localhost api uri will be used  ```http://127.0.0.1:8000```

**expressions_file** should be in form:

```
<num of expressions>
<expression1>
<expression2>
...
```

STDOUT will be in form:

```
<result1> <calculation time 1>
<result2> <calculation time 1>
...
```
