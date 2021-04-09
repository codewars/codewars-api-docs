# Webhooks

Webhooks allows you to receive notifications when events occur.

Like API v1, webhooks feature was never actively developed and poorly documented.
It's not very usable at the moment.

## Structure

> Sample Event (Code Challenge Created)

```
User-Agent: Codewars Hookbot
Content-Type: application/json
X-Webhook-Event: code_challenge
X-Webhook-Secret: some-shared-secret
```

```json
{
  "action": "created",
  "code_challenge": {
    "id": "50654ddff44f800200000001",
    "created_by_id": "508f2708b3be0c0200000002"
  }
}
```


When an event occurs in the Codewars system, any relevant webhooks will be triggered to the specified URL. Typically,
events are categorized into **event** and **actions**. Typically an event references *what type of model* 
(i.e. `code_challenge`) and the action references what happened to it (i.e. `created`).


<aside class="notice">
Webhooks use the same terminology as the rest of the API. For example, <em>kata</em> are referenced as a <em>code challenge</em>.
</aside>

Webhooks typically contain a very small payload (often times, it only contains the `id` of some object). You may need
to query the rest of the API to get more information about a particular object.

## Register your Webhook

> Webhook Ping Event

```
User-Agent: Codewars Hookbot
Content-Type: application/json
X-Webhook-Event: webhook
```
```json
{
  "action": "updated",
  "webhook": {
    "id": "53aa3f265b97485984000001"
  }
}
```


Visit your [Codewars account page](https://www.codewars.com/users/edit) and add a webhook. A webhook takes the
following input:

| Input | Meaning |
| ----- | ------- |
| Payload URL | The server endpoint that will relieve the webhook payload (e.g, `https://example.com/my/endpoint`) |
| Secret | An optional secret shared between you and our webhook service. Ensures only Codewars is sending you the webhook |

Once you create or update your webhook, your endpoint will receive a webhook updated event.

## Code Challenges

> Sample Webhook Payload

```
User-Agent: Codewars Hookbot
Content-Type: application/json
X-Webhook-Event: code_challenge
```

```json
{
  "action": "<action - i.e. 'created'>",
  "code_challenge": {
    "id": "53aa3f265b97485984000001",
    "created_by_id": "53af25145b97487568000001"
  }
}
```
> The solution_finalized also includes the following json:

```json
{
  "solution": {
    "id": "53aa3f265b97485984000001",
    "user_id": "53417de006654f4171000587"
  }
}
```

The following actions are supported:

| Action               | Meaning |
| -------------------- | ------- |
| `created`            | Code challenge was created |
| `approved`           | A code challenge was successfully approved (no longer in beta state) |
| `voted`              | Someone voted on the code challenge. Does not specify what type of vote. |
| `solution_finalized` | Someone submitted a solution to the code challenge |


## User


> Webhook Headers

```
User-Agent: Codewars Hookbot
Content-Type: application/json
X-Webhook-Event: user
```

> `rank_earned` Event

```json
{
  "action": "rank_earned",
  "user": {
    "id": "53aa3f265b97485984000001",
    "rank": -5
  },
  "language": null
}
```

> `honor_changed` Event

```json
{
  "action": "honor_changed",
  "user": {
    "id": "53aa3f265b97485984000001",
    "honor": 420,
    "honor_delta": 3
  }
}
```

The following actions are supported:

| Action          | Meaning |
| --------------- | ------- |
| `rank_earned`   | The user's rank has been upgraded. Could be a global rank, or a language rank |
| `honor_changed` | The user's honor has changed (usually in a positive direction) |
