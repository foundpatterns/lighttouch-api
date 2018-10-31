event: ["list_documents_json"]
priority: 1

-- GET /[type]/[uuid]
local model_name = request.path_segments[1]

local uuids = {}

content.walk_documents(nil, function (file_uuid, header, body)
  if header.type == model_name then
    table.insert(uuids, file_uuid)
  end
end)

local body = json.from_table({documents=uuids})

return {
  headers = {
    ["content-type"] = "application/json",
  },
  body = body
}
