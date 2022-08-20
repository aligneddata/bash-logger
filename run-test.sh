#!/bin/bash

source ./logger.sh

echo "start of program"

log_trace "Trace message"
log_debug "Debug message"
log_info "Info message"
log_warning "Warning message"
log_error "Error message"
log_fatal "Fatal message"


echo "end of program"
