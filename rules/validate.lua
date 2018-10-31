priority: 1
input_parameter: "request"
events_table: ["validate_documents"]

log.trace(require("third-party.inspect")(request))
if request.path_segments[1] == "validate_documents"
then
    events[events_table[1]]:trigger(events_parameters)
end
