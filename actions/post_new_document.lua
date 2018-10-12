event: ["requestProcess_post_document"]
priority: 1

local inspect = require "inspect"

local new_todo = ClientRequest.build()
    :method("GET")
    :uri("http://google.com/")
    :headers({ ["content-type"] = "application/json" })
    :body("new_todo")
    :send()

    --print(inspect(new_todo))
    
    response = {
        body = inspect(new_todo)
    }        

    return response
