weight: 1
parameters: ["request", "events"]

if
  request.method == "POST"
  and
  request.path == "/"
  then
    events["request_post_document"]:trigger(request)
end
