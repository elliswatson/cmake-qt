cmake_minimum_required(VERSION 3.16)

project(helloworld VERSION 0.0.0 LANGUAGES CXX)



#set(CMAKE_AUTOUIC ON)
#set(CMAKE_AUTOMOC ON)
#set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_PREFIX_PATH C:/Qt/6.5.3/mingw_64/lib/cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
#spdlog config
add_subdirectory(lib/spdlog )
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 11)
  SET(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

#json cmake config
set(JSON_BuildTests OFF CACHE INTERNAL "")
add_subdirectory(lib/json)

get_property(dirs DIRECTORY ${CMAKE_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
include_directories(include)

get_property(includeDirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
message("Include Directories: ${includeDirs}")
aux_source_directory("./src" code_src)


find_package(Qt6 COMPONENTS Widgets REQUIRED)

message("PROJECT_NAME :" ${PROJECT_NAME})
add_executable(${PROJECT_NAME} ${code_src})

target_link_libraries(${PROJECT_NAME} 
  Qt6::Widgets
  spdlog::spdlog
  nlohmann_json::nlohmann_json
)


