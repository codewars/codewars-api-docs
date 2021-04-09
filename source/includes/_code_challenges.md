# Code Challenges API

## Get Code Challenge

Return a code challenge information.

```bash
curl https://www.codewars.com/api/v1/code-challenges/valid-braces
```

> Response

```json
{
  "id": "5277c8a221e209d3f6000b56",
  "name": "Valid Braces",
  "slug": "valid-braces",
  "url": "http://www.codewars.com/kata/valid-braces",
  "category": "algorithms",
  "description": "Write a function called `validBraces` that takes a string ...",
  "tags": ["Algorithms", "Validation", "Logic", "Utilities"],
  "languages": ["javascript", "coffeescript"],
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
  "totalAttempts": 4911,
  "totalCompleted": 919,
  "totalStars": 12,
  "voteScore": 512,
  "publishedAt": "2013-11-05T00:07:31Z",
  "approvedAt": "2013-12-20T14:53:06Z"
}
```


### HTTP Request

`https://www.codewars.com/api/v1/code-challenges/{challenge}`

### Path Parameters

| Parameter   | Description    |
| ----------- | -------------- |
| `challenge` | ID or slug     |


### CodeChallenge Object

| Field                | Type          | Description                                             |
| -------------------- | ------------- | ---------------------------------------                 |
| `id`                 | `string`      | ID of the kata.                                         |
| `name`               | `string`      | Name of the kata.                                       |
| `slug`               | `string`      | Slug of the kata.                                       |
| `url`                | `string`      | URL of the kata.                                       |
| `category`           | `string`      | Category of the kata.                                   |
| `description`        | `string`      | Description of the kata in Markdown.    |
| `tags`               | `string[]`    | Array of tags associated with the kata. |
| `languages`          | `string[]`    | Array of language names the kata is available in. |
| `rank`               | `object?`     | Object describing the rank of the kata if approved.           |
| `createdBy`          | `object`      | The author of the kata. |
| `publishedAt`        | `string`      | Date and time when the kata was first published.        |
| `approvedBy`         | `object?`     | The approver of the kata. |
| `approvedAt`         | `string`      | Date and time when the kata was approved.        |
| `totalCompleted`     | `number`      | Total number of completions. |
| `totalAttempts`      | `number`      | Total number of attempts. |
| `totalStars`         | `number`      | The number of bookmarks. |
| `voteScore`          | `number`      | The sum of all votes casted. |
| `contributorsWanted` | `boolean`     | Whether to allow contributions. |
| `unresolved`         | `object`      | Object with fields `issues` and `suggestions` for the number of unresolved issues and suggestions respectively. |

### User Object

| Field                | Type          | Description                             |
| -------------------- | ------------- | --------------------------------------- |
| `username`           | `string`      | Username of the user.                   |
| `url`                | `string`      | URL of the user's profile.              |


