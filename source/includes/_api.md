# REST API

Our REST API can be used to retrieve information about users and code challenges (kata). It also provides the ability
to begin a new code challenge session and submit solutions.

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
    "approvedBy": "xDranik",
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


## POST Train Next Code Challenge

```bash
curl "https://www.codewars.com/api/v1/code-challenges/javascript/train" \
 -X POST \
 -H "Authorization: some-api-key" \
 -d "strategy=random"
```

```json
{
   "success":true,
   "name":"Anything to integer",
   "slug":"anything-to-integer",
   "description":"Your task is to program a function which converts any input to an integer.\n\nDo not perform rounding, the fractional part should simply be discarded.\n\nIf converting the input to an integer does not make sense (with an object, for instance), the function should return 0 (zero).\n\nAlso, Math.floor(), parseInt() and parseFloat() are disabled for your unconvenience.\n\nOnegaishimasu!",
   "author":"Jake Hoffner",
   "rank":-6,
   "averageCompletion":125.4,
   "tags":[
      "Fundamentals",
      "Integers",
      "Data Types",
      "Numbers"
   ],
   "session":{
       "projectId":"533f66fba0de5d94410001ec",
       "solutionId":"53bc968d35fd2feefd000004",
       "setup":"function toInteger(n) {\n  \n}",
       "exampleFixture":"Test.expect(toInteger(\"4.55\") === 4)",
       "code":null
   }
}
```

This endpoint begins a new training session for the next code challenge (kata) within your training queue.

### HTTP REQUEST
`https://www.codewars.com/api/v1/code-challenges/:language/train`

Input | Meaning
---------- | -------
language | The programming language you wish to train on.
strategy | The strategy to use for choosing what the next code challenge should be. (Optional)
peek | Boolean - true if you only want to peek at the next item in your queue, without removing it from the queue or beginning a new training session.

<aside class="warning">
If the next code challenge within your queue is one that you have not started yet, then a timer will begin as soon as
the request is made. The timer is used solely for tracking average completion times and does not affect your honor in
any way.
</aside>

### Strategy Values

Possible values for selecting a code challenge selection strategy.

<aside class="notice">
All strategies will prefer incomplete and non-started code challenges, unless otherwise stated.
</aside>

Value | Meaning
------- | --------
default | Also referred to as the "Rank Up" workout. Will select a challenge that is above your current level.
random | Randomly selected code challenges
reference_workout | Will select code challenges that are tagged as reference.
beta_workout | Will select beta code challenges.
retrain_workout | Will focus on code challenges that you have already completed.
algorithm_retest | Will focus on algorithm code challenges that you have already completed.
kyu_8_workout | Will focus on 8 kyu code challenges.
kyu_7_workout | Will focus on 7 kyu code challenges.
kyu_6_workout | Will focus on 6 kyu code challenges.
kyu_5_workout | Will focus on 5 kyu code challenges.
kyu_4_workout | Will focus on 4 kyu code challenges.
kyu_3_workout | Will focus on 3 kyu code challenges.
kyu_2_workout | Will focus on 2 kyu code challenges.
kyu_1_workout | Will focus on 1 kyu code challenges.


### JSON Field Notes

Key | Notes
------ | -------
description | The code challenge description is given in markdown format.
projectId | This ID value will be needed when submitting a solution.
solutionId | This ID value will be needed when submitting a solution.
setup | This is the initial solution code that is given to a user.
exampleFixture | This is the example test cases that are initially given to a user.
code | If the user is continuing a previous started solution, this value will represent their previous work.


## POST Train Code Challenge

```bash
curl "https://www.codewars.com/api/v1/code-challenges/anything-to-integer/javascript/train" \
 -X POST \
 -H "Authorization: some-api-key"
```

```json
{
   "success":true,
   "name":"Anything to integer",
   "slug":"anything-to-integer",
   "description":"Your task is to program a function which converts any input to an integer.\n\nDo not perform rounding, the fractional part should simply be discarded.\n\nIf converting the input to an integer does not make sense (with an object, for instance), the function should return 0 (zero).\n\nAlso, Math.floor(), parseInt() and parseFloat() are disabled for your unconvenience.\n\nOnegaishimasu!",
   "author":"Jake Hoffner",
   "rank":-6,
   "averageCompletion":125.4,
   "tags":[
      "Fundamentals",
      "Integers",
      "Data Types",
      "Numbers"
   ],
   "session":{
       "projectId":"523f66fba0de5d94410001cb",
       "solutionId":"53bc968d35fd2feefd000013",
       "setup":"function toInteger(n) {\n  \n}",
       "exampleFixture":"Test.expect(toInteger(\"4.55\") === 4)",
       "code":null
   }
}
```

This endpoint begins a new training session for the specified code challenge (kata)

### HTTP REQUEST
`https://www.codewars.com/api/v1/code-challenges/:id_or_slug/:language/train`

Input | Meaning
---------- | -------
language | The programming language you wish to train on.

<aside class="warning">
If the code challenge has not been started by yet by the user, then a timer will begin as soon as
the request is made. The timer is used solely for tracking average completion times and does not affect the user's honor in
any way.
</aside>

## POST Attempt Solution

```bash
curl "https://www.codewars.com/api/v1/code-challenges/projects/523f66fba0de5d94410001cb/solutions/53bc968d35fd2feefd000013/attempt" \
 -X POST \
 -d code=function(){//example code\n}
 -H "Authorization: some-api-key"
```

```json
{
   "success":true,
   "dmid":"4rsdaDf8d"
}
```

This endpoint is used to submit a solution to be validated by the code challenge author's test cases. It will return a
deferred message id (dmid) which will be used to poll for the response. Polling must be used to retrieve the response.

### HTTP REQUEST
`https://www.codewars.com/api/v1/code-challenges/projects/:project_id/solutions/:solution_id/attempt`

Input | Meaning
---------- | -------
code | The code that you is being submitted
output_format | The output format to be used. By default, `html` is used. `raw` can also be specified.

## POST Finalize Solution

```bash
curl "https://www.codewars.com/api/v1/code-challenges/projects/523f66fba0de5d94410001cb/solutions/53bc968d35fd2feefd000013/finalize" \
 -X POST \
 -H "Authorization: some-api-key"
```

```json
{
   "success":true
}
```

This endpoint is used to finalize the previously submitted solution. This endpoint will only return a success message if
there has been a previously successful solution.

## GET Deferred Response

```bash
curl "https://www.codewars.com/api/v1/deferred/4rsdaDf8d" \
 -H "Authorization: some-api-key"
```

```json
{
   "success":true,
   "dmid":"4rsdaDf8d",
   "valid": false,
   "reason":"-e: Value is not what was expected (Test::Error)\n",
   "output":[
      "<div class='console-failed'>Value is not what was expected</div>"
   ],
   "wall_time":45
}
```

### HTTP REQUEST
`https://www.codewars.com/api/v1/deferred/:dmid`

This endpoint is used for polling for a deferred response. This is to be used in conjunction with the attempt endpoint.

<aside class="warning">
Polling should not be performed more than twice a second. If a API consumer abuses the rate guidelines, its IP address
will be temporarily suspended.
</aside>


