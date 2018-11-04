event: ["request_post_document"]
priority: 1
input_parameters: ["request"]

-- POST /
local document_uuid = uuid.v4()

local fields = {
    type = request.body.model,
    request_uuid = request.uuid,
}
for k, v in pairs(request.body) do
    local field_name = k:match("^fields%.(.+)$")
    if field_name then
        fields[field_name] = v
    end
end

content.write_file (request.profile_uuid or "home", document_uuid, fields, request.body.body)

return {
    headers = {
        ["content-type"] = "application/json",
        ["X-Request-ID"] = request.uuid 
    },
    body = json.from_table(params)
}
