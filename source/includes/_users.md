# Users API

## Get User

Returns a user information.

```bash
curl https://www.codewars.com/api/v1/users/some_user
```

> Response

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

### HTTP Request

`https://www.codewars.com/api/v1/users/{user}`

### Path Parameters

| Parameter | Description    |
| --------- | -------------- |
| `user`    | Username or ID |

### User Object

| Field                 | Type                   | Description                                     |
| --------------------- | ---------------------- | ----------------------------------------------- |
| `username`            | `string`               | Username of the user.                           |
| `name`                | `string`               | Name of the user.                               |
| `honor`               | `number`               | Total honor points earned by the user.          |
| `clan`                | `string`               | Name of the clan.                               |
| `leaderboardPosition` | `number`               | The user's position on the overall leaderboard. |
| `skills`              | `string[]`             | Array of skills entered by the user.            |
| `ranks`               | `object`               | Ranks object with overall and language ranks.   |
| `codeChallenges`      | `object`               | Object with fields `totalAuthored` and `totalCompleted` for the number of authored and completed kata respectively. |

### Ranks Object

| Field                 | Type                   | Description                                   |
| --------------------- | ---------------------- | --------------------------------------------- |
| `overall`             | `object`               | Overall rank.                                 |
| `languages`           | `object`               | Ranks for each language trained.              |

### Rank Object

| Field                 | Type                   | Description                                                    |
| --------------------- | ---------------------- | -------------------------------------------------------------- |
| `rank`                | `number`               | Rank in integer. `[-8, -1]` maps to kyu, `[1, 8]` maps to dan. |
| `name`                | `string`               | Either `{-rank} kyu` or `{rank} dan`.         |
| `color`               | `string`               | The color of the rank. Possible colors are `white` (7-8 kyu), `yellow` (5-6 kyu), `blue` (3-4 kyu), `purple` (1-2 kyu), `black` (1-4 dan), and `red` (5-8 dan). |
| `score`               | `number`               | The total score earned. This is the number that determines the rank. |


## List Completed Challenges

Lists challenges completed by a user, 200 items per page. Use `page` parameter (zero based) to paginate.

```bash
curl http://www.codewars.com/api/v1/users/some_user/code-challenges/completed?page=0
```

> Response

```json
{
  "totalPages": 1,
  "totalItems": 1, 
  "data": [
    {
      "id": "514b92a657cdc65150000006",
      "name": "Multiples of 3 and 5",
      "slug": "multiples-of-3-and-5",
      "completedAt": "2017-04-06T16:32:09Z",
      "completedLanguages": [ 
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
    }
  ]
}
```


### HTTP Request

`https://www.codewars.com/api/v1/users/{user}/code-challenges/completed?page={page}`

### Path Parameters

| Parameter | Description    |
| --------- | -------------- |
| `user`    | Username or ID |

### Query Parameters

| Parameter | Description                                            | Default |
| --------- | ------------------------------------------------------ | ------- |
| `page`    | The page offset. Each page contains at most 200 items. |       0 |

### CompletedChallenge Object

| Field                | Type        | Description                             |
| -------------------- | ----------- | --------------------------------------- |
| `id`                 | `string`    | ID of the kata.                         |
| `name`               | `string`    | Name of the kata.                       |
| `slug`               | `string`    | Slug of the kata.                       |
| `completedAt`        | `string`    | Date and time of the completion.        |
| `completedLanguages` | `string[]`  | Array of languages a user completed in. |



## List Authored Challenges

List challenges authored by the user.

```bash
curl http://www.codewars.com/api/v1/users/some_user/code-challenges/authored
```

> Response

```json
{
  "data": [
    {
      "id": "5571d9fc11526780a000011a",
      "name": "The builder of things",
      "description": "For this kata you will be using some meta-programming ...",
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
      "languages": ["ruby", "javascript", "python", "coffeescript"]
    },
    {
      "id": "51ba717bb08c1cd60f00002f",
      "name": "Range Extraction",
      "description": "A format for expressing an ordered list of integers ...",
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

### HTTP Request

`https://www.codewars.com/api/v1/users/{user}/code-challenges/authored`

### Path Parameters

| Parameter | Description    |
| --------- | -------------- |
| `user`    | Username or ID |

### AuthoredChallenge Object

| Field                | Type          | Description                             |
| -------------------- | ------------- | --------------------------------------- |
| `id`                 | `string`      | ID of the kata.                         |
| `name`               | `string`      | Name of the kata.                       |
| `description`        | `string`      | Description of the kata in Markdown.    |
| `rank`               | `number?`     | Rank of the kata if approved.           |
| `rankName`           | `string?`     | Rank name of the kata if approved.      |
| `tags`               | `string[]`    | Array of tags associated with the kata. |
| `languages`          | `string[]`    | Array of language names the kata is available in. |

