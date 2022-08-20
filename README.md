README
======

What is BASH Logger?
-------------------
BASH Logger is a small and lightweight library for simplifying log generation in shell scripts.

In general, logging should be easy, fast, and helpful, and when developing small scripts this characteristics are even more important. With shell scripts we are usually solving small problems, or automating small tasks, we don't want to struggle with logging, we want it to work.

BASH Logger uses convention over configuration, it comes ready to import and use, setting parameters to common values for zero configuration, but if you want, most aspects (and more to come) of the logging process can be configured to provide personalization for special needs.

The aim is not to build another logging framework, or to substitute existing ones, but to keep it as a fast, easy and lightweight library.

Enjoy it

Configuration variables
-----------------------

### Default values
    LOG_PATH=.
    LOG_FILE=log
    LOG_LEVEL=0
    LOG_PREFIX=""
    LOG_DATEFORMAT="%Y/%m/%d %H:%M:%S"
    LOG_MESSAGEFORMAT="%-19s - %-5s - %s\n"

### LOG_PATH
Path where the LOG_FILE will be generated.

### LOG_FILE
Name of the file in which the log messages will be written.

### LOG_LEVEL
Severity threshold at which the log messages will be written to the file.

    0 TRACE
    1 DEBUG
    2 INFO
    3 WARN
    4 ERROR
    5 FATAL

### LOG_DATEFORMAT
Format for the date being generated for each log message, you can use any GNU date format value as show in the date command man pages.

### LOG_MESSAGEFORMAT
Format to be used in the printf command that generates the line, currently it supports three string values, the first being the date, the second the severity and the third the log message.

### LOG_STDOUT
Set this varibale to something not "" to also dump the log messages to the standard output

External environmental variables
--------------------------------
Above LOG_* variables allow you to control logging inside the scripts. Environmental variables below allow you to control the output from running environment without modifying the script.

    SH_LOG_PATH: log file path
    SH_LOG_FILE: log file name
    SH_LOG_LEVEL:
        1 - TRACE
        2 - DEBUG
        3 - INFO
        4 - WARN
        5 - ERROR
        6 - FATAL
    SH_LOG_DATEFORMAT: date format in logged contents. Default: %Y/%m/%d %H:%M:%S
    SH_LOG_MESSAGEFORMAT: log message format. Default: "%-19s - %-5s - %s\n" for DATE, LEVEL
                          and payload messages.
    SH_LOG_STDOUT: 1 - output to stdout, in additional to log file
                   2 - do not output to stdout.

Refer to run-test-external-control.sh for an example.

Loading the library
-------------------
As with any shell script, you can load the library by calling the source file from your script (preferable option) or if you want to embed it, you can paste the contents directly in your script.

    # Load the logger library
    . logger.sh

Using the functions
-------------------
Once imported, using the library is as easy as calling the helper functions and passing the desired message, quoting it when spaces are involved.

    log_trace "Trace message"
    log_debug "Debug message"
    log_info "Info message"
    log_warning "Warning message"
    log_error "Error message"
    log_fatal "Fatal message"

Things to do
------------
* Allow more personalization of the log message
* Support of simple log rotation

Contribute
----------
* Check for open issues or open a new one to start a discussion around a feature idea or a bug.
* Fork the repository, makie your changes and send a pull request
* Original repo and author: https://github.com/aligneddata/ksh-logger
