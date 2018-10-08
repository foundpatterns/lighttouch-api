event: "reqProcess"
priority: 1

local debug = require "utils.debug"

local log_text = debug.print_req_info_return(req)
local log_file = io.open("logs/" .. uuid.v4(), "w")

log_file:write(log_text)
log_file:close()                                
