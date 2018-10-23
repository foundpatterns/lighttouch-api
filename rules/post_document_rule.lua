weight: 1
parameters: ["request", "events"]

if
  arguments["request"].method == "POST"
  and
  arguments["request"].path == "/"
  then
    arguments["events"]["request_post_document"]:trigger(arguments["request"])
end
