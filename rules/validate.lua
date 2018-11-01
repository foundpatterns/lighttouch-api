priority: 1

if request.path_segments[1] == "validate_documents"
then
    events["validate_documents"]:trigger(request)
end
