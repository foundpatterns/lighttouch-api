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
    local _, _, _store = contentdb.read_document(id)
    store = _store
else
    store = request.profile_uuid or contentdb.home
end

contentdb.write_file (store, id or document_uuid, fields, request.body.body)

-- <meta http-equiv="refresh" content="0; URL='/issue/'" /> html redirect example
local redirect = "<!DOCTYPE html><html><head><meta http-equiv=\"refresh\" content=\"0; URL='/".. fields['model'] .."/'\" /></head></html>"
log.debug(json.from_table(fields))
return {
    headers = {
        ["content-type"] = "text/html",
        ["X-Request-ID"] = request.uuid
    },
    body = redirect
}
