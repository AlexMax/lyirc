ragel_target(proto proto.rl ${CMAKE_CURRENT_BINARY_DIR}/proto.cpp)

add_executable(lyirc WIN32
	app.cpp
	app_thread.cpp			app_thread.h
	view/main_view.cpp		view/main_view.h
	gui/main_frame.cpp		gui/main_frame.h
	gui/main_frame_base.cpp	gui/main_frame_base.h
	proto.rl				${CMAKE_CURRENT_BINARY_DIR}/proto.cpp)
target_compile_definitions(lyirc PUBLIC
	"_CRT_SECURE_NO_WARNINGS"
	${wxWidgets_DEFINITIONS} ${wxWidgets_DEFINITIONS_DEBUG})
target_include_directories(lyirc PUBLIC ${wxWidgets_INCLUDE_DIRS})
target_link_libraries(lyirc ${wxWidgets_LIBRARIES} asio)