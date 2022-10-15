if (WIN32)
    cmake_minimum_required(VERSION 3.12)
elseif (APPLE)
    cmake_minimum_required(VERSION 3.17)
elseif (UNIX)
    cmake_minimum_required(VERSION 3.16)
endif ()

project(OcrLibTest)
set(CMAKE_CXX_STANDARD 11)
add_definitions(-DUNICODE -D_UNICODE)

# import OcrLib
include(${CMAKE_CURRENT_SOURCE_DIR}/OcrLib/OcrLibWrapper.cmake)
find_package(OcrLib REQUIRED)
if (OcrLib_FOUND)
    message(STATUS "OcrLib_LIBS: ${OcrLib_LIBS}")
    message(STATUS "OcrLib_INCLUDE_DIRS: ${OcrLib_INCLUDE_DIRS}")
else ()
    message(FATAL_ERROR "OcrLib Not Found!")
endif (OcrLib_FOUND)
# End Of Ocr CLib

# Test CLib Program
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
set(TESTSRC src/maintest.cpp)
add_executable(OcrLibTest ${TESTSRC})
include_directories(${OpenCV_INCLUDE_DIRS})
target_link_libraries(OcrLibTest ${OcrLib_LIBS})

# Install exe
install(TARGETS OcrLibTest EXPORT OcrLibTest)

# Install test script
if (WIN32)
    file(GLOB TEST_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/resource/*.bat)
else ()
    file(GLOB TEST_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/resource/*.sh)
endif ()
install(FILES ${TEST_SCRIPT} DESTINATION ${CMAKE_INSTALL_PREFIX})

# Install images dir
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/resource/images DESTINATION ${CMAKE_INSTALL_PREFIX})

# Install models dir
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/resource/models DESTINATION ${CMAKE_INSTALL_PREFIX})