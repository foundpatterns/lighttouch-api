event: ["request_post_document"]
priority: 1

-- POST /
local document_uuid = uuid.v4()
local incoming_request_uuid = uuid.v4()
local params = {
    type = request.body.type,
    uuid = incoming_request_uuid,
    fields = {
        title = request.body.title,
        body = request.body.body,
        created = request.body.created or "",
        updated = request.body.updated or "",
    }
}

content.write_file (request.profile_uuid, document_uuid, params, request.body.text)

return {
    headers = {
        ["content-type"] = "application/json",
        ["X-Request-ID"] = incoming_request_uuid 
    },
    body = json.from_table(params)
}
