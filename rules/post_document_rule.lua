if request.method == "POST" and request.path == "/" then
    events["reqProcess_post_document"]:trigger(req)
end
