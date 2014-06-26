# Webhooks
Webhooks allows you to relieve notifications of when events occur. 

The Codewars webhooks design is inspired by [GitHub's webhooks](https://developer.github.com/webhooks/)

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
Webhooks use the same terminology as the rest of the API. For example, *kata* are referenced as a *code_challenge*
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

Input | Meaning
----- | -------
Payload URL | The server endpoint that will relieve the webhook payload (i.e. `http://example.com/my/endpoint`)
Secret | An optional secret shared between you and our webhook service. Ensures only Codewars is sending you the webhook
Events (future) | Whitelist which events you receive

Once you create or update your webhook, your endpoint will receive a webhook updated event.
