set(OcrLib_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/include")
include_directories(${OcrLib_INCLUDE_DIRS})
link_directories(${CMAKE_CURRENT_LIST_DIR}/lib)
set(OcrLib_LIBS RapidOcrOnnx)
# Install clib
file(GLOB OCR_INSTALL_LIBS ${CMAKE_CURRENT_LIST_DIR}/lib/*.*)
install(FILES ${OCR_INSTALL_LIBS} DESTINATION lib)
