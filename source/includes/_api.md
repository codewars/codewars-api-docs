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


## GET completed code challenges for a given user

```bash
curl "http://www.codewars.com:3000/api/v1/users/some_user/code_challenges/completed"
```

```json
{
  "completedCodeChallenges": [{
          "id":"514b92a657cdc65150000006",
          "name":"Multiples of 3 and 5",
          "slug":"multiples-of-3-and-5",
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


## GET attempted code challenges for a given user

```bash
curl "http://www.codewars.com:3000/api/v1/users/some_user/code_challenges/authored"
```

```json

{
  "authoredCodeChallenges":{
      "_id":"50654ddff44f800200000001",
      "_slugs":["broken-greetings"],
      "admin_tags":null,
      "api_version":1,
      "approvals_count":0,
      "approved_at":"2013-12-03T15:32:28Z",
      "approved_by_id":"5099936d1cafdc0200000097",
      "average_completion":235.954799189812,
      "beta_status":"feedback_needed",
      "category":"bug_fixes",
      "comments":[{
        "_id":"5299f137caa22dd70f000323",
        "comment_reference_id":"5299f137caa22dd70f000324",
        "created_at":"2013-11-30T14:07:51Z",
        "edit_count":4,
        "extra":null,
        "label":null,
        "last_edited_on":null,
        "markdown":"Isn't `assertEquals()` the better choice than `expect()`  as  shown in the solution tab?",
        "masked":false,
        "masked_by_id":"5299e17ad21189665f0002c3",
        "state":"fresh",
        "updated_at":"2014-01-06T19:07:14Z",
        "user_id":"5299e17ad21189665f0002c3",
        "votes":[{
          "_id":"5299f137b5570d9a97000322",
          "created_at":"2013-11-30T14:07:51Z",
          "updated_at":"2013-11-30T14:07:51Z",
          "user_id":"5299e17ad21189665f0002c3",
          "value":1
        }],
        "votes_score":1
      },{
        "_id":"52b22fbb139b6fed0c000039",
        "comment_reference_id":"52b22fbb139b6fed0c00003a",
        "created_at":"2013-12-18T23:28:59Z",
        "edit_count":0,
        "extra":{
          "status":"approved",
          "beta":false,
          "published":true
        },
        "label":null,
        "last_edited_on":null,
        "markdown":"Simpler code, so I would prefer assertEquals. With expect you shoud use \"toEqual()\" for the same result. Despite that, I cannot think of a reason to choose one over the other.",
        "masked":null,
        "masked_by_id":null,
        "state":"fresh",
        "updated_at":"2013-12-18T23:28:59Z",
        "user_id":"52b22ad786b31630d000000d",
        "votes":[{
          "_id":"52b22fbb139b6fed0c00003b",
          "created_at":"2013-12-18T23:28:59Z",
          "updated_at":"2013-12-18T23:28:59Z",
          "user_id":"52b22ad786b31630d000000d",
          "value":1
        }],
        "votes_score":1
      },{
      "_id":"52b2666b139b6fdc6f0001ec",
      "comment_reference_id":"52b2666b139b6fdc6f0001ed",
      "comments":[{
        "_id":"52b266cb139b6fdc6f0001ef",
        "comment_reference_id":"52b266cb139b6fdc6f0001f0",
        "created_at":"2013-12-19T03:23:55Z",
        "edit_count":0,
        "extra":null,
        "label":null,
        "last_edited_on":null,
        "markdown":"BTW this is an old kata. And by old, i mean one of the first 5. Its actually using an older version of the kata framework, which is why Test.expect has a different signature here. ",
        "masked":null,
        "masked_by_id":null,
        "state":"fresh",
        "updated_at":"2013-12-19T03:23:55Z",
        "user_id":"508f2708b3be0c0200000002",
        "votes":[{
          "_id":"52b266cb139b6fdc6f0001f1",
          "created_at":"2013-12-19T03:23:55Z",
          "updated_at":"2013-12-19T03:23:55Z",
          "user_id":"508f2708b3be0c0200000002",
          "value":1
        }],
        "votes_score":1
      }],
      "created_at":"2013-12-19T03:22:19Z",
      "edit_count":0,
      "extra":{
        "status":"approved",
        "beta":false,
        "published":true
      },
      "label":null,
      "last_edited_on":null,
      "markdown":"`assertEquals` also provides better validation messaging. `expect` just gives you a generic error. Best practices is always to use assertEquals unless you specifically intend to have a vague error message.",
      "masked":null,
      "masked_by_id":null,
      "state":"fresh",
      "updated_at":"2014-03-30T11:31:31Z",
      "user_id":"508f2708b3be0c0200000002",
      "votes":[{
        "_id":"52b2666b139b6fdc6f0001ee",
        "created_at":"2013-12-19T03:22:19Z",
        "updated_at":"2013-12-19T03:22:19Z",
        "user_id":"508f2708b3be0c0200000002",
        "value":1
      }],
      "votes_score":1
    }],
    "created_at":"2012-09-28T07:12:31Z",
    "created_by_id":"508f2708b3be0c0200000002",
    "description":"Correct this code, so that the greet function returns the expected value.",
    "estimated_rank":null,
    "forks_count":0,
    "input":"",
    "languages":[{
      "_id":"50654ddff44f800200000002",
      "answer":"function Person(name){\n  this.name = name;\n}\n\nPerson.prototype.greet = function(otherName){\n  return \"Hi \" + otherName + \", my name is \" + this.name;\n}\n","code_challenge_review_id":"5197f8b7d2822fb530000088",
      "created_at":null,
      "example_fixture":"",
      "fixture":"person1 = new Person('Joe');\nperson2 = new Person('Jane');\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n",
      "name":"javascript",
      "package":"",
      "rank_applied_to_author":true,
      "setup":"function Person(name){\n  this.name = name;\n}\n\nPerson.prototype.greet = function(otherName){\n  return \"Hi \" + otherName + \", my name is \" + name;\n}\n","updated_at":"2013-11-11T16:43:14Z"
    },
    {
      "_id":"50654ddff44f800200000003",
      "answer":"Person = (name) ->\n  @name = name\n\nPerson::greet = (otherName) ->\n  \"Hi #{otherName}, my name is #{@name}\"\n",
      "code_challenge_review_id":"519d8086d6bb1bd1b7000006",
      "created_at":null,
      "example_fixture":"",
      "fixture":"person1 = new Person('Joe')\nperson2 = new Person('Jane')\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n",
      "name":"coffeescript",
      "package":"",
      "rank_applied_to_author":true,
      "setup":"Person = (name) ->\n  @name = name\n\nPerson::greet = (otherName) ->\n  \"Hi #{otherName}, my name is #{name}\"\n","updated_at":"2013-11-11T16:43:14Z"
    },
    {
      "_id":"5197ca54afd04bfb92000259",
      "answer":"class Person\n  def initialize(name)\n    @name = name\n  end\n  \n  def greet(other_name)\n    \"Hi #{other_name}, my name is #{@name}\"\n  end\nend","code_challenge_review_id":"5197e860d2822f96fc000055",
      "created_at":null,
      "example_fixture":"",
      "fixture":"person1 = Person.new('Joe')\nperson2 = Person.new('Jane')\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n",
      "name":"ruby",
      "package":"",
      "rank_applied_to_author":true,
      "setup":"class Person\n  def initialize(name)\n    @name = name\n  end\n  \n  def greet(other_name)\n    \"Hi #{other_name}, my name is #{name}\"\n  end\nend","updated_at":"2013-11-11T16:43:14Z"
    }],
    "last_published_at":"2013-12-03T15:42:33Z",
    "last_revision_number":3,
    "name":"Broken Greetings",
    "output":"Hi Kate, my name is Joe\nHi Kate, my name is Jane\n",
    "published_at":"2013-05-18T18:37:08Z",
    "published_status":"approved",
    "rank":-8,
    "rank_applied_to_author":true,
    "rank_applied_to_author_at":"2014-04-05T00:45:29Z",
    "rejections_count":0,
    "retired_at":null,
    "retired_by_id":null,
    "revisions":[{
      "_id":"528109e36daa53cd5d000021",
      "created_at":null,
      "message":null,
      "number":0,
      "revised_attributes":{
        "name":"Broken Greetings",
        "description":"Why does the greet function not return the expected value?",
        "category":"bug_fixes",
        "status":"draft",
        "tags":[]
      },
      "revised_embeds":{
        "languages":{
          "50654ddff44f800200000002":{
            "package":"",
            "setup":"function Person(name){\n  this.name = name;\n}\n\nPerson.prototype.greet = function(otherName){\n  return \"Hi \" + otherName + \", my name is \" + name;\n}\n",
            "answer":"function Person(name){\n  this.name = name;\n}\n\nPerson.prototype.greet = function(otherName){\n  return \"Hi \" + otherName + \", my name is \" + this.name;\n}\n",
            "fixture":"person1 = new Person('Joe');\nperson2 = new Person('Jane');\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n"},
            "50654ddff44f800200000003":{
              "package":"",
              "setup":"Person = (name) ->\n  @name = name\n\nPerson::greet = (otherName) ->\n  \"Hi #{otherName}, my name is #{name}\"\n",
              "answer":"Person = (name) ->\n  @name = name\n\nPerson::greet = (otherName) ->\n  \"Hi #{otherName}, my name is #{@name}\"\n",
              "fixture":"person1 = new Person('Joe')\nperson2 = new Person('Jane')\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n"},
              "5197ca54afd04bfb92000259":{
                "package":"",
                "setup":"class Person\n  def initialize(name)\n    @name = name\n  end\n  \n  def greet(other_name)\n    \"Hi #{other_name}, my name is #{name}\"\n  end\nend",
                "answer":"class Person\n  def initialize(name)\n    @name = name\n  end\n  \n  def greet(other_name)\n    \"Hi #{other_name}, my name is #{@name}\"\n  end\nend",
                "fixture":"person1 = Person.new('Joe')\nperson2 = Person.new('Jane')\nTest.expect(person1.greet('Kate'), \"Hi Kate, my name is Joe\")\nTest.expect(person2.greet('Kate'), \"Hi Kate, my name is Jane\")\n"
              }
            }
          },
          "tag":null,
          "user_id":"508f2708b3be0c0200000002"
        },{
          "_id":"528109e36daa53cd5d000022",
          "created_at":null,
          "message":null,
          "number":1,
          "revised_attributes":{
            "status":"published"
          },
          "revised_embeds":{
            "languages":{}
          },
          "tag":null,
          "user_id":"508f2708b3be0c0200000002"
        },{
          "_id":"529df98c2ea29ceee600088b",
          "created_at":"2013-12-03T15:32:28Z",
          "message":null,
          "number":2,
          "revised_attributes":{
            "description":"Correct this code so that the greet function will return the expected value:"
          },
          "revised_embeds":{
            "languages":{}
          },
          "tag":null,
          "user_id":"5099936d1cafdc0200000097"
        },{
          "_id":"529dfbe92ea29cba780008ad",
          "created_at":"2013-12-03T15:42:33Z",
          "message":null,
          "number":3,
          "revised_attributes":{
            "description":"Correct this code so that the greet function returns the expected value."
          },
          "revised_embeds":{
            "languages":{}
          },
          "tag":null,
          "user_id":"5099936d1cafdc0200000097"
        }],
        "state":"approved",
        "status":"published",
        "system_tags":["Bugs"],
        "tags":[],
        "total_attempts":150437,
        "total_compete_attempts":35,
        "total_compete_completed":35,
        "total_compete_skipped":0,
        "total_completed":50610,
        "total_down_votes":0,
        "total_favorites":0,
        "total_feedback":0,
        "total_flag_votes":0,
        "total_players":101510,
        "total_plays":133923,
        "total_seconds":23951771.665757816,
        "total_skips":48,
        "total_stars":5,
        "total_up_votes":3,
        "total_vote_score":5,
        "training_schedule_ids":["5196da6e9ec615ccfc00005f"],
        "updated_at":"2014-07-11T22:20:37Z"
      }
    }
```


This endpoint returns a list of all code challenges authored by a given user

### HTTP REQUEST
`https://www.codewars.com/api/v1/users/:id_or_username/code_challenges/authored`


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

### HTTP REQUEST
`https://www.codewars.com/api/v1/deferred/:dmid`

This endpoint is used for polling for a deferred response. This is to be used in conjunction with the attempt endpoint.

<aside class="warning">
Polling should not be performed more than twice a second. If a API consumer abuses the rate guidelines, its IP address
will be temporarily suspended.
</aside>


