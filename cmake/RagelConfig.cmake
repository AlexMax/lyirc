include(FindPackageHandleStandardArgs)

find_program(Ragel_EXECUTABLE ragel)

find_package_handle_standard_args(ragel REQUIRED_VARS Ragel_EXECUTABLE)

macro(ragel_target name input output)
	add_custom_command(OUTPUT ${output}
		DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/${input}"
		COMMAND ${Ragel_EXECUTABLE} -o ${output} "${CMAKE_CURRENT_SOURCE_DIR}/${input}")
endmacro()