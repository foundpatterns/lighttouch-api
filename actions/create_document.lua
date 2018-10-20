event: ["request_post_document"]
weight: 1

local helpers = require("helpers")

-- POST /
local post_uuid = uuid.v4()
local file = io.open("content/" .. post_uuid, "w")
local params = {
    title = request.body.title,
    type = request.body.type,
}

local yaml_string = yaml.dump(params)
local document_text = yaml_string .. "\n...\n" .. request.body.text
local document_params = helpers.split_document(document_text, post_uuid)

file:write(document_text)
file:close()

return {
    headers = {
        ["content-type"] = "application/json",
        ["X-Request-ID"] = post_uuid 
    },
    body = render("document.json", { document = document_params }),
}
