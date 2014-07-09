# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: some-api-key"
```

> Make sure to replace `some-api-key` with your API key.

Codewars uses API access keys to allow access to restricted endpoints. Access keys are specific to a user account and can be found by navigating
to your Account Settings (`https://www.codewars.com/users/edit`).

Codewars expects for the API access key to be included in most API requests.
It can be included either via a header:

`Authorization: some-api-key`

or by passing it as a parameter:

`?access_key=some-api-key`

<aside class="notice">
You must replace `some-api-key` with your personal API key found within your account settings.
</aside>
