event: ["request_document_json"]
priority: 1
parameters: ["request"]

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

local header, body = content.split_header(document)

local html_body = markdown_to_html(body, {safe = true})

local template_params = {
  uuid = id,
  type = header.type,
  title = header.title,
  body = body,
  created = header.created or "",
  updated = header.updated or "",
}

local json = render("document.json", { document = template_params })

log.debug(json)

return {
    headers = {
        ["content-type"] = "application/json",
    },
    body = json
}
