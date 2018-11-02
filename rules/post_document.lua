priority: 1
input_parameter: "request"
events_table: ["request_post_document"]


  request.method == "POST"
  and
  request.path == "/"
