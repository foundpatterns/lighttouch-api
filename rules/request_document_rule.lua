local utils = require "utils"

if 
	req.method == "GET"
	and
	req.path:match("^/%a+/" .. utils.uuid_pattern .. "/?$")
    and
    string.match( req.headers["accept"], "json" )
    then
    events["request_document_json"]:trigger(req)
end
