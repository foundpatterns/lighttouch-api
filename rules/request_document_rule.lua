if req.method == "GET"
and #req.path_segments == 2
and req.path_segments[1]:match("%a+") -- TODO: make it a known type, not just any word
and req.path_segments[2]:match(utils.uuid_pattern)
--and string.match( req.headers["accept"], "json" )
then
    events["request_document_json"]:trigger(req)
end
