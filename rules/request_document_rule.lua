priority: 2
local utils = require "utils"

if request.method == "GET" and request.path:match("^/%a+/" .. utils.uuid_pattern .. "/?$") then
    if string.match( request.headers["accept"], "json" ) then
        events["requestProcess_document_json"]:trigger(request) -- This is for json only
    elseif string.match( request.headers["accept"], "html" ) then
        events["requestProcess_document_html"]:trigger(request) -- This is for html only
    end
end
