local utils = require "utils"

if request.method == "GET" and request.path:match("^/%a+/" .. utils.uuid_pattern .. "/?$") then
    if string.match( request.headers["accept"], "json" ) then
        events["reqProcess_document_json"]:trigger(req) -- This is for json only
    elseif string.match( request.headers["accept"], "html" ) then
        events["reqProcess_document_html"]:trigger(req) -- This is for html only
    end
end
