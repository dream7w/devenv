

#method 1:set src list
#SET(SRC_LIST test.c)
#ADD_EXECUTABLE(hello ${SRC_LIST})

#method 2:all src file in cur dir
AUX_SOURCE_DIRECTORY(. DIR_SRCS)
ADD_LIBRARY(aaa STATIC ${DIR_SRCS})
#ADD_LIBRARY(aaa SHARED ${DIR_SRCS})

#copy files
FILE(GLOB ZHEADERS ./*.h
                   ./*.hpp)


SET(ZHEADERDEST ${ZINCDIR}/src)
ADD_CUSTOM_COMMAND(TARGET aaa PRE_BUILD
                      COMMAND ${CMAKE_COMMAND} -E 
                        make_directory ${ZHEADERDEST})

FOREACH(ZHEADER ${ZHEADERS})
  ADD_CUSTOM_COMMAND(TARGET aaa PRE_BUILD
                      COMMAND ${CMAKE_COMMAND} -E 
                        copy ${ZHEADER} ${ZHEADERDEST}
                      COMMENT "copy ${ZHEADER} ${ZHEADERDEST}")
ENDFOREACH()

##############remove .svn dir###############
## Gather list of all files in "/config"
#file(GLOB ConfigFiles RELATIVE ${CMAKE_SOURCE_DIR}/config
#     ${CMAKE_SOURCE_DIR}/config/*)
## Gather list of all files in "/config/.svn"
#file(GLOB SvnConfigFiles RELATIVE ${CMAKE_SOURCE_DIR}/config 
#     ${CMAKE_SOURCE_DIR}/config/.svn/*)
## Remove ".svn" and its contents from the list
#list(REMOVE_ITEM ConfigFiles .svn ${SvnConfigFiles})
#foreach(ConfigFile ${ConfigFiles})
#  add_custom_command(TARGET MyTarget PRE_BUILD
#                     COMMAND ${CMAKE_COMMAND} -E
#                         copy ${CMAKE_SOURCE_DIR}/config/${ConfigFile}
#                              $<TARGET_FILE_DIR:MyTarget>)
#endforeach()
##############remove .svn dir###############
 
