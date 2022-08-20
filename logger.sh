##########################################################################################
# BASH and KSH Logger library
# Log generator for shell scripts
#
# Jesus Moreno Amor <jesus@morenoamor.com>
#
# 2022.05.08 aligneddata add external environment variables
#
# Environment variables supported:
# SH_LOG_PATH: log file path
# SH_LOG_FILE: log file name
# SH_LOG_LEVEL
#     1 - TRACE
#     2 - DEBUG
#     3 - INFO
#     4 - WARN
#     5 - ERROR
#     6 - FATAL
# SH_LOG_DATEFORMAT: date format in logged contents. Default: %Y/%m/%d %H:%M:%S
# SH_LOG_MESSAGEFORMAT: log message format. Default: "%-19s - %-5s - %s\n" for DATE, LEVEL
#                       and payload messages.
# SH_LOG_STDOUT: 1 - output to stdout, in additional to log file
#                2 - do not output to stdout.

##########################################################################################

##########################################################################################
# Configuration variables
##########################################################################################
get_env_or_default () {
  env_var="$1"
  default_val="$2"
  if [ "$env_var" = "" ]; then
    echo "$default_val"
  else
    echo "$env_var"
  fi
}

LOG_PATH=$(get_env_or_default "$SH_LOG_PATH" ".")
LOG_FILE=$(get_env_or_default "$SH_LOG_FILE" "logfile")
LOG_LEVEL=$(get_env_or_default "$SH_LOG_LEVEL" "2") # 2 - DEBUG
LOG_DATEFORMAT=$(get_env_or_default "$SH_LOG_DATEFORMAT" "%Y/%m/%d %H:%M:%S")
LOG_MESSAGEFORMAT=$(get_env_or_default "$SH_LOG_MESSAGEFORMAT" "%-19s - %-5s - %s\n")
LOG_STDOUT=$(get_env_or_default "$SH_LOG_STDOUT" "1")


##########################################################################################
# Auxiliary functions
##########################################################################################
log_trace(){
  if [[ $LOG_LEVEL -le 1 ]]
  then
    do_log TRACE $1
  fi
}

log_debug(){
  if [[ $LOG_LEVEL -le 2 ]]
  then
    do_log DEBUG $1
  fi
}

log_info(){
  if [[ $LOG_LEVEL -le 3 ]]
  then
    do_log INFO $1
  fi
}

log_warning(){
  if [[ $LOG_LEVEL -le 4 ]]
  then
    do_log WARN $1
  fi
}

log_error(){
  if [[ $LOG_LEVEL -le 5 ]]
  then
    do_log ERROR $1
  fi
}

log_fatal(){
  if [[ $LOG_LEVEL -le 6 ]]
  then
    do_log FATAL $1
  fi
}

##########################################################################################
# Main function
##########################################################################################
logger_init(){
    [[ -d $LOG_PATH ]] || mkdir -p $LOG_PATH
}

do_log(){
  SEVERITY=$1
  shift
  printf "$LOG_MESSAGEFORMAT" "$(date +"$LOG_DATEFORMAT")" "$SEVERITY" "$*" >> "$LOG_PATH"/"$LOG_FILE"
  [[ $LOG_STDOUT ]] && printf "$LOG_MESSAGEFORMAT" "$(date +"$LOG_DATEFORMAT")" "$SEVERITY" "$*"
}

logger_init