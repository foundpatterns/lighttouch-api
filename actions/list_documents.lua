event: ["list_documents_json"]
priority: 1
input_parameters: ["request"]

-- GET /[type]/[uuid]
local model_name = request.path_segments[1]

local uuids = {}

content.walk_documents(nil, function (file_uuid, header, body)
  if header.model == model_name then

    -- Filter the documents using the query params
    for k, v in pairs(request.query) do
      if header[k] ~= v then
        -- Don't add this document to the list
        return
      end
    end

    table.insert(uuids, file_uuid)
  end
end)

return {
  headers = {
    ["content-type"] = "application/json",
  },
  body = json.from_table({documents=uuids})
}
