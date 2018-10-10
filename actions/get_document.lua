event: ["request_document_json"]
priority: 1

-- GET /[type]/[uuid]
local type, id = req.path_segments[1], req.path_segments[2]
local template_params
local document = fs.read_file("content/" .. id)

log.debug("file path = " .. "content/" .. id)
log.debug("file content = " .. document)

--document = fs.read_file("templates/index.html")

if not document then events["request_nonexistent_document"]:trigger(req)
end

local helpers = require "helpers"
local template_params = helpers.split_document(document, id)

log.debug(render("document.json", { document = template_params }))

return {
    headers = {
        ["content-type"] = "application/json",
    },
    body = render("document.json", { document = template_params })
}
