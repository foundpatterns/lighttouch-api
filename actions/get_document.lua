event: ["request_document_json"]
weight: 1

-- GET /[type]/[uuid]
local type, id = request.path_segments[1], request.path_segments[2]
local template_params
local document = fs.read_file("content/" .. id)

log.debug("file path = " .. "content/" .. id)

--document = fs.read_file("templates/index.html")

if not document then
  events["request_nonexistent_document"]:trigger(request)
  return
end

log.debug("file content = " .. document)

local helpers = require "helpers"
local template_params = helpers.split_document(document, id)

log.debug(render("document.json", { document = template_params }))

return {
    headers = {
        ["content-type"] = "application/json",
    },
    body = render("document.json", { document = template_params })
}
