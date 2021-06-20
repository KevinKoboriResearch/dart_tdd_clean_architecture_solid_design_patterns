# HTTP

> ## Success
1. ✅ Request with valid http verb (post)
2. ✅ Pass the content type JSON in the header
3. Claim Request with correct body
3. Ok - 200 and answer with data
4. No content - 204 and answer without data

> ## Errors
1. Bad request - 400
2. Unathourized - 401
3. Forbidden - 403
4. Not Found - 404
5. Internal server error - 500

> ## Exception - Status code different from those mentioned above
1. Internal server error - 500

> ## Exception - Http request gave some exception
1. Internal server error - 500

> ## Exception - invalid http verb
1. Internal server error - 500