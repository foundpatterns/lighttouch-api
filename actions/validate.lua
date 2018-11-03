event: ["validate_documents"]
priority: 1
input_parameters: ["request"]

local err = content.walk_documents("home", function (uuid, header, body)

  header.model = header.type
  local result, err = content.validate_document(header)
  if not result then
    return "Validation failed in document " .. uuid .. ": " .. err
  end

end)

if err then
  log.error(err)
  return {
    headers = {},
    status = 500,
    body = err
  }
else
  return { headers = {}, body = "All documents validated correctly" }
end