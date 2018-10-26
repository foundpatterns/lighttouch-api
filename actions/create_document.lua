event: ["request_post_document"]
priority: 1

local content = require("content")

-- POST /
local post_uuid = uuid.v4()
local file_uuid = uuid.v4()

local params = {
    type = request.body.type,
    uuid = post_uuid,
    attributes = {
        title = request.body.title,
        body = request.body.body,
        created = request.body.created or "",
        updated = request.body.updated or "",
    }
}

content.write_file (post_uuid, file_uuid, params, request.body.text)

return {
    headers = {
        ["content-type"] = "application/json",
        ["X-Request-ID"] = post_uuid 
    },
    body = json.dump(params)
}
