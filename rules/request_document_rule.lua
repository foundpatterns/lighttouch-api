weight: 2
parameters: ["request", "events"]

if arguments["request"].method == "GET"
and #arguments["request"].path_segments == 2
and arguments["request"].path_segments[1]:match("%a+") -- TODO: make it a known type, not just any word
and arguments["request"].path_segments[2]:match(utils.uuid_pattern)
--and string.match( request.headers["accept"], "json" )
then
    arguments["events"]["request_document_json"]:trigger(arguments["request"])
end