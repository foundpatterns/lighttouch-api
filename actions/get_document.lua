event: ["request_document_json"]
priority: 1

-- GET /[type]/[uuid]
local model_name, id = request.path_segments[1], request.path_segments[2]

local header, body = content.read_document(id)
if not header then
  return {
    headers = { ["content-type"] = "application/json" },
    body = json.from_table({msg="Document not found"})
  }
end

if header.type ~= model_name then
  return {
    headers = { ["content-type"] = "application/json" },
    body = json.from_table({msg="Document is not of model " .. model_name})
  }
end


return {
  headers = { ["content-type"] = "application/json" },
  body = json.from_table({
    fields = header,
    body = body
  })
}