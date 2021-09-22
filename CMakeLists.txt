cmake_minimum_required(VERSION 3.21)

project(
    "some-application"
    DESCRIPTION "A project with nested library"
    VERSION 0.9.2
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(libraries)

add_executable(${PROJECT_NAME})

target_sources(
    ${PROJECT_NAME}
    PRIVATE
        main.cpp
)

target_link_libraries(${PROJECT_NAME} PRIVATE SomeLibrary)

# where to find our CMake modules
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
#message(STATUS "CMake module path: ${CMAKE_MODULE_PATH}")
include(InstallingGeneral)
include(Packing)
