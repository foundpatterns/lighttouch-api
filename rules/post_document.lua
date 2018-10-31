priority: 1
input_parameter: "request"
events_table: ["request_post_document"]

if
  request.method == "POST"
  and
  request.path == "/"
  then
    events[events_table[1]]:trigger(request)
end
