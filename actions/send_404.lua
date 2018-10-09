log.debug("")
return {
    headers = {
        ["content-type"] = "application/json",
    },
    status = 404,
    body = '{"error": "Document not found"}',
}