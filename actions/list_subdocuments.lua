event = ["list_subdocuments_json"]
priority = 1
input_parameters = ["request"]


-- GET /[type]
local base_model = request.path_segments[1]
local document_uuid = request.path_segments[2]
local model_name = request.path_segments[3]

local uuids = {}

content.walk_documents(nil, function (doc_id, fields, body)
  if fields.model ~= model_name then return end
  if fields[base_model] == document_uuid then
    table.insert(uuids, doc_id)
  end
end)



if #uuids == 0 then uuids = nil end

return {
  headers = {
    ["content-type"] = "text/html",
  },
  body = json.from_table({
    base_model = base_model,
    model = model_name,
    uuid = document_uuid,
    documents = uuids
  })
}
