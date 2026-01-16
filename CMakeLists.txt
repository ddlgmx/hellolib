cmake_minimum_required(VERSION 3.15...4.1)
project(hellolib VERSION 1.0 LANGUAGES CXX)

add_library(HelloWorldLib hello_world.cpp)

# --- FIXED THIS LINE ---
target_include_directories(HelloWorldLib PUBLIC 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

# --- Keep the rest the same as before ---
install(TARGETS HelloWorldLib
        EXPORT hellolibTargets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)

install(EXPORT hellolibTargets
        FILE hellolibConfig.cmake
        NAMESPACE hellolib::
        DESTINATION lib/cmake/hellolib)

install(DIRECTORY include/ DESTINATION include)