# Errors

Codewars uses conventional HTTP response codes to indicate success or failure of an API request.
In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from
the provided information (e.g. a required parameter was missing, a charge failed, etc.), and codes in the
5xx range indicate an error with Codewars' servers.


Error Code | Meaning
---------- | -------
400 | Bad Request -- Something went wrong
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- You do not have permission to access this resource
404 | Not Found -- The specified resource could not be found
405 | Method Not Allowed -- You tried to access a resource with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
422 | Unprocessable Entity -- Your input failed validation.
429 | Too Many Requests -- You're making too many API requests.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
