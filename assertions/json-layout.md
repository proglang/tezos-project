Definition of JSON for AST
==========================
For using the AST, gained by parsing the assertion statement, in different languages it is useful to export it to the JSON data format. The JSON data format is defined in the following.

explanations
------------
For \<type>, \<quantifier>, etc. see the [syntax definition](https://github.com/proglang/tezos-project/tree/master/assertions/grammar).  
`%multiple` defines, that there can be multiple instances of the previously listed definition. The instances are then separated by comma.

example
-------
### general
```
{
  "entrypoints": [
    {
      "identifier": <IDENT>,
      "parameters": [
        {
          "name": <IDENT>,
          "type": <type>,
          "content": [
            <type>,
            %multiple
          ]
        },
        ...
      ],
      "content": {
        "type": "quantification",
        "quantifier": <quantifier>,
        "declaration": {
          "name": <IDENT>,
          "type": <type>,
          "content": [
            <type>,
            %multiple
          ]
        },
        "content": {
          "type": "condition",
          "operation": {
            "type": "operation",
            "operation": <operation>,
            "operands": [
              <operation> | <variable> | <constant>
              %multiple
            ]
          },
          "content": {
            "type": "assertion",
            "operation": {
              "type": "operation",
              "operation": <operation>,
              "operands": [
                <operation> | <variable> | <constant>
                %multiple
              ]
            }
          }
        }
      }
    },
    ...
  ]
}
```

### specific
**Assertion:**
```
(* %A: Just an example, no functionality *)
(entrypoint ((p : int) _)
  (forall (n : int)
    (if (gt p 1)
      (assert (mod p n))
    )
  )
)
```

**JSON:**
```
{
  "entrypoints": [
    {
      "identifier": "A",
      "parameters": [
        {
          "name": p,
          "type": "int",
          "content": []
        },
        ...
      ],
      "content": {
        "type": "quantification",
        "quantifier": "forall",
        "declaration": {
          "name": "n",
          "type": "int",
          "content": []
        },
        "content": {
          "type": "condition",
          "operation": {
            "type": "operation",
            "operation": "gt",
            "operands": [
              {
                "type": "variable",
                "name": "p"
              },
              {
                "type": "int_literal",
                "value": 1
              }
            ]
          },
          "content": {
            "type": "assertion",
            "operation": {
              "type": "operation",
              "operation": "mod",
              "operands": [
                {
                  "type": "variable",
                  "name": "p"
                },
                {
                  "type": "variable",
                  "name": "n"
                }
              ]
            }
          }
        }
      }
    },
    ...
  ]
}
```

\<body>
------
```
{
  "entrypoints": [
    <entrypoint>,
    %multiple
  ]
}
```

\<entrypoint>
------------
```
{
  "identifier": <IDENT>,
  "parameters": [
    <declaration>,
    %multiple
  ],
  "content": <quantification>
}
```

\<declaration>
---------
e.g. `p : (list int)`  
as `{"name": "p", "type":"list", "content" : [{"name":none, "type":"int", "content":[]}, ...]`

```
{
  "name": <IDENT> | none,
  "type": <type>
  "content": [
    <type>,
    %multiple
  ]
}
```

\<quantification>
-----------
e.g. `forall (n : int)`

```
{
  "type": "quantification",
  "quantifier": <quantifier>,
  "declaration": <declaration>,
  "content": <quantification> | <condition> | <assertion>
}
```

\<condition>
-----------
e.g. `if (gt (length p) 10)`

```
{
  "type": "condition",
  "operation": <operation>,
  "content": <quantification> | <condition> | <assertion>
}
```

\<assertion>
------------
e.g. `assert (eq (nth 9 p) 7)`

```
{
  "type": "assertion",
  "operation": <operation>
}
```

\<operation>
------------
```
{
  "type": "operation",
  "operation": <operation>,
  "operands": [
    <operation> | <variable> | <constant>
    %multiple
  ]
}
```

\<variable>
------------
e.g. from previous declaration

```
{
  "type": "variable",
  "name": <IDENT>
}
```

\<constant>
-----------
```
{
  "type": "bool_literal" | "int_literal" | "string_literal"
  "value": bool | int | string
}
```
