#CMake Version
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#Project Name
PROJECT(HELLO)

#Project Install Path
#SET(CMAKE_INSTALL_PREFIX /path)

#Complie Opitions Setting 
SET(CMAKE_CXX_FLAGS "-g -Wall -Werror") 
#or 
#ADD_DEFINITIONS(-g -Wall -Werror)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -lpthread -lrt") 
#lpthread:thread
#lrt:time

#Include Directories Setting
#INCLUDE_DIRECTORIES(...)

#Link Directories Setting
#LINK_DIRECTORIES(...)



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


#Add Sub Directories
#ADD_SUBDIRECTORY(src bin)
ADD_SUBDIRECTORY(test)
ADD_SUBDIRECTORY(test1)

#将当前目录下的源代码文件列表赋值给SRC_LIST
#AUX_SOURCE_DIRECTORY(. SRC_LIST)

#创建可执行文件
#ADD_EXECUTABLE(appName ${SRC_LIST})
#创建动态库
#ADD_LIBRARY(libName SHARED ${SRC_LIST})

#库依赖关系
#ADD_DEPENDENCIES(litName dependLibName ...)

#添加要链接的共享库
#TARGET_LINK_LIBRARIES(xxx ...)






