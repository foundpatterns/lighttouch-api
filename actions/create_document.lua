event = ["request_post_document"]
priority = 1
input_parameters = ["request"]

-- POST /
local document_uuid = uuid.v4()

local fields = {
    model = request.body.model,
    request_uuid = request.uuid,
}

for k, v in pairs(request.body) do
    local field_name = k:match("^fields%.(.+)$")
    if field_name then
        fields[field_name] = v
    end
end


local id, store = request.body.id
if id then
    local _, _, _store = content.read_document(id)
    store = _store
else
    store = request.profile_uuid or content.home
end

content.write_file (store, id or document_uuid, fields, request.body.body)

return {
    headers = {
        ["content-type"] = "application/json",
        ["X-Request-ID"] = request.uuid
    },
    body = json.from_table(params)
}
