function(enable_project_warnings target_name)
    if(NOT TARGET "${target_name}")
        message(FATAL_ERROR "Cannot enable warnings: target '${target_name}' does not exist")
    endif()

    target_compile_options("${target_name}"
        PRIVATE
            $<$<COMPILE_LANGUAGE:C,CXX>:-Wall;-Wextra;-Wpedantic>
    )
endfunction()
