if
	req.method == "POST"
	and
	req.path == "/"
	then
    events["request_post_document"]:trigger(req)
end
