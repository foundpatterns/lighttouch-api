event: ["request_nonexistent_document"]
priority: 1

log.debug("my 404")
return {
    headers = {
        ["content-type"] = "application/json",
    },
    status = 404,
    body = '{"error": "Document not found"}',
}