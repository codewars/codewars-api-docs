# REST API

Our REST API can be used to retrieve information about users and code challenges (kata).

## GET User

```bash
curl "https://www.codewars.com/api/v1/users/some_user"
```

```json
{
    "username": "some_user",
    "name": "Some Person",
    "honor": 544,
    "clan": "some clan",
    "leaderboardPosition": 134,
    "skills": [
        "ruby",
        "c#",
        ".net",
        "javascript",
        "coffeescript",
        "nodejs",
        "rails"
    ],
    "ranks": {
        "overall": {
            "rank": -3,
            "name": "3 kyu",
            "color": "blue",
            "score": 2116
        },
        "languages": {
            "javascript": {
                "rank": -3,
                "name": "3 kyu",
                "color": "blue",
                "score": 1819
            },
            "ruby": {
                "rank": -4,
                "name": "4 kyu",
                "color": "blue",
                "score": 1005
            },
            "coffeescript": {
                "rank": -4,
                "name": "4 kyu",
                "color": "blue",
                "score": 870
            }
        }
    },
    "codeChallenges": {
        "totalAuthored": 3,
        "totalCompleted": 230
    }
}
```

This endpoint returns information about a specific user.

### HTTP REQUEST
`https://www.codewars.com/api/v1/users/:id_or_username`


## GET User: Completed Challenges

```bash
curl "http://www.codewars.com/api/v1/users/some_user/code-challenges/completed?page=0"
```

```json
{
  "totalPages": 1,
  "totalItems": 1, 
  "data": [{
          "id":"514b92a657cdc65150000006",
          "name":"Multiples of 3 and 5",
          "slug":"multiples-of-3-and-5",
          "completedAt": "2017-04-06T16:32:09Z",
          "completedLanguages":[ 
            "javascript",
            "coffeescript",
            "ruby",
            "javascript",
            "ruby",
            "javascript",
            "ruby",
            "coffeescript",
            "javascript",
            "ruby",
            "coffeescript"
          ]
  }]
}
```

This endpoint returns a list of all code challenges completed by a given user. By default only the first 200 code challenges will be returned. You can page the results using the `page` param. The param is zero based.

### HTTP REQUEST
`https://www.codewars.com/api/v1/users/:id_or_username/code-challenges/completed?page=0`

## GET User: Authored Challenges

```bash
curl "http://www.codewars.com/api/v1/users/some_user/code-challenges/authored"
```

```json
{
  "data": [
    {
      "id": "5571d9fc11526780a000011a",
      "name": "The builder of things",
      "description": "For this kata you will be using some meta-programming magic to create a new `Thing` object. This object will allow you to define things in a descriptive **sentence like format**.",
      "rank": -3,
      "rankName": "3 kyu",
      "tags": [
        "Algorithms",
        "Metaprogramming",
        "Programming Paradigms",
        "Advanced Language Features",
        "Fundamentals",
        "Domain Specific Languages",
        "Declarative Programming"
      ],
      "languages": [
        "ruby",
        "javascript",
        "python",
        "coffeescript"
      ]
    },
    {
      "id": "51ba717bb08c1cd60f00002f",
      "name": "Range Extraction",
      "description": "A format for expressing an ordered list of integers is to use a comma separated list of either\n\n* individual integers\n* or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'. The range includes all integers in the interval including both endpoints.  It is not considered a range unless it spans at least 3 numbers.",
      "rank": -4,
      "rankName": "4 kyu",
      "tags": [
        "Algorithms",
        "String Formatting",
        "Formatting",
        "Logic",
        "Strings"
      ],
      "languages": [
        "javascript",
        "coffeescript",
        "ruby",
        "go",
        "python",
        "java",
        "haskell",
        "csharp",
        "cpp"
      ]
    }
  ]
}
```


This endpoint returns a list of all code challenges authored by a given user

### HTTP REQUEST
`https://www.codewars.com/api/v1/users/:id_or_username/code-challenges/authored`


## GET Code Challenge

```bash
curl "https://www.codewars.com/api/v1/code-challenges/valid-braces"
```

```json
{
    "id": "5277c8a221e209d3f6000b56",
    "name": "Valid Braces",
    "slug": "valid-braces",
    "category": "algorithms",
    "publishedAt": "2013-11-05T00:07:31Z",
    "approvedAt": "2013-12-20T14:53:06Z",
    "languages": [
        "javascript",
        "coffeescript"
    ],
    "url": "http://www.codewars.com/kata/valid-braces",
    "rank": {
        "id": -4,
        "name": "4 kyu",
        "color": "blue"
    },
    "createdBy": {
        "username": "xDranik",
        "url": "http://www.codewars.com/users/xDranik"
    },
    "approvedBy": {
        "username": "xDranik",
        "url": "http://www.codewars.com/users/xDranik"
    },
    "description": "Write a function called `validBraces` that takes a string of braces, and determines if the order of the braces is valid. `validBraces` should return true if the string is valid, and false if it's invalid.\n\nThis Kata is similar to the Valid Parentheses Kata, but introduces four new characters. Open and closed brackets, and open and closed curly braces. Thanks to @arnedag for the idea!\n\nAll input strings will be nonempty, and will only consist of open parentheses '(' , closed parentheses ')', open brackets '[', closed brackets ']', open curly braces '{' and closed curly braces '}'. \n\n<b>What is considered Valid?</b>\nA string of braces is considered valid if all braces are matched with the correct brace. <br/>\nFor example:<br/>\n'(){}[]' and '([{}])' would be considered valid, while '(}', '[(])', and '[({})](]' would be considered invalid.\n\n\n<b>Examples:</b> <br/>\n`validBraces( \"(){}[]\" )` => returns true <br/>\n`validBraces( \"(}\" )` => returns false <br/>\n`validBraces( \"[(])\" )` => returns false <br/>\n`validBraces( \"([{}])\" )` => returns true <br/>\n",
    "totalAttempts": 4911,
    "totalCompleted": 919,
    "totalStars": 12,
    "tags": [
        "Algorithms",
        "Validation",
        "Logic",
        "Utilities"
    ]
}
```

This endpoint returns information about a specific code challenge (kata).

### HTTP REQUEST
`https://www.codewars.com/api/v1/code-challenges/:id_or_slug`
