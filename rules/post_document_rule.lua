priority: 1
if
  request.method == "POST"
  and
  request.path == "/"
  then
    events["request_post_document"]:trigger(request)
end
