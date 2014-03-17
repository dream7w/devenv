PROJECT(HELLO)

###################create normal dir#####################
SET(ZTOPDIR ${PROJECT_SOURCE_DIR})
SET(ZINCDIR ${ZTOPDIR}/inc)
SET(ZBINDIR ${ZTOPDIR}/bin)
SET(ZLIBDIR ${ZTOPDIR}/lib)

#To create a directory while CMake is configuring your build environment,
FILE(MAKE_DIRECTORY ${ZINCDIR})
FILE(MAKE_DIRECTORY ${ZBINDIR})
FILE(MAKE_DIRECTORY ${ZLIBDIR})
#To create a directory at build time,
#execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${directory})
###################create normal dir#####################


SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
#MESSAGE(STATUS "This is binary dir:" ${PROJECT_BINARY_DIR})
#MESSAGE(STATUS "This is source dir:" ${PROJECT_SOURCE_DIR})
#MESSAGE(STATUS "This is exe dir:" ${EXECUTABLE_OUTPUT_PATH})
#MESSAGE(STATUS "This is lib dir:" ${LIBRARY_OUTPUT_PATH})

SET(CMAKE_CXX_FLAGS "-Wall") 
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -lpthread -lrt") 
#lpthread:thread
#lrt:time

ADD_SUBDIRECTORY(src bin)
ADD_SUBDIRECTORY(test bin)
ADD_SUBDIRECTORY(test1 bin)
