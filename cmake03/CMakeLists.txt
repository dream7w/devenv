#required: version check
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#required: project name
PROJECT(Demo)

#opitional: build type debug or release or others
SET(CMAKE_BUILD_TYPE debug)


#opitional: 指定c编译器
#SET(CMAKE_C_COMPILER "/bin/gcc")
#opitional: 指定c编译Debug及Release选项
#SET(CMAKE_C_FLAGS_DEBUG "$ENV{CFLAGS} -o0 -Wall -g -ggdb")
#SET(CMAKE_C_FLAGS_RELEASE "$ENV{CFLAGS} -o3 -Wall")


#opitional: 指定c++编译器
#SET(CMAKE_CXX_COMPILER "/bin/g++")
#opitional: 指定c++编译Debug及Release选项
SET(local_common_flags "-Wall -W -std=c++0x -lrt")
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -o0 -g -ggdb ${local_common_flags}")
#SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -o3 ${local_common_flags}")


#required: project dir
SET(local_project_dir ${PROJECT_SOURCE_DIR})
SET(local_project_inc_dir ${local_project_dir}/inc)
SET(local_project_lib_dir ${local_project_dir}/lib/${CMAKE_BUILD_TYPE})
SET(local_project_bin_dir ${local_project_dir}/bin/${CMAKE_BUILD_TYPE})

#FILE(REMOVE_RECURSE ${local_project_inc_dir})
#FILE(REMOVE_RECURSE ${local_project_lib_dir})
#FILE(REMOVE_RECURSE ${local_project_bin_dir})

FILE(MAKE_DIRECTORY ${local_project_inc_dir})
FILE(MAKE_DIRECTORY ${local_project_lib_dir})
FILE(MAKE_DIRECTORY ${local_project_bin_dir})

#required: set lib output path
SET(LIBRARY_OUTPUT_PATH ${local_project_lib_dir})
#required: set executable output path
SET(EXECUTABLE_OUTPUT_PATH ${local_project_bin_dir})


#required: common functions
#func_set_lib_type: 设置依赖库后缀
FUNCTION(func_set_lib_type)
  STRING(TOLOWER ${ARGV0} type)
  IF (${type} STREQUAL "static")
    SET (local_lib_subfix ".a" PARENT_SCOPE)
  ELSE()
    SET (local_lib_subfix ".so" PARENT_SCOPE)
  ENDIF()
ENDFUNCTION()

#func_add_depends
FUNCTION(func_add_depends)
  FOREACH(trd ${ARGN})
    STRING(TOLOWER ${trd} item)
    IF (${item} STREQUAL "protobuf")
      INCLUDE_DIRECTORIES(${local_project_dir}/thirdlib/protobuf/src)
      LINK_DIRECTORIES(${local_project_dir}/thirdlib/protobuf/lib/${CMAKE_SYSTEM_NAME}_${CMAKE_SYSTEM_PROCESSOR})
      LIST(APPEND local_temp_depend_libs ${item}${local_lib_subfix})
    ENDIF()

    IF (${item} STREQUAL "printaaa")
      INCLUDE_DIRECTORIES(${local_project_dir}/src)
      LINK_DIRECTORIES(${local_project_lib_dir})
      MESSAGE(${local_project_lib_dir})
      LIST(APPEND local_temp_depend_libs ${item}${local_lib_subfix})
    ENDIF()
  ENDFOREACH()
  #UNSET(local_depend_libs)
  SET(local_depend_libs ${local_temp_depend_libs} PARENT_SCOPE)
ENDFUNCTION()



func_set_lib_type("static")

#required: add sub dir
ADD_SUBDIRECTORY(src)
ADD_SUBDIRECTORY(test)










#opitional: 执行命令
#execute_process(COMMAND "pwd" OUTPUT_VARIABLE local_cur_path)



#一、变量的引用方式是使用“${}”，在IF中，不需要使用这种方式，直接使用变量名即可
#二、自定义变量使用SET(OBJ_NAME xxxx)，使用时${OBJ_NAME}
#三、cmake的常用变量：
#CMAKE_BINARY_DIR,PROJECT_BINARY_DIR,_BINARY_DIR：
#这三个变量内容一致，如果是内部编译，就指的是工程的顶级目录，如果是外部编译，指的就是工程编译发生的目录。
#CMAKE_SOURCE_DIR,PROJECT_SOURCE_DIR,_SOURCE_DIR：
#这三个变量内容一致，都指的是工程的顶级目录。
#CMAKE_CURRENT_BINARY_DIR：外部编译时，指的是target目录，内部编译时，指的是顶级目录
#CMAKE_CURRENT_SOURCE_DIR：CMakeList.txt所在的目录
#CMAKE_CURRENT_LIST_DIR：CMakeList.txt的完整路径
#CMAKE_CURRENT_LIST_LINE：当前所在的行
#CMAKE_MODULE_PATH：如果工程复杂，可能需要编写一些cmake模块，这里通过SET指定这个变量
#LIBRARY_OUTPUT_DIR,BINARY_OUTPUT_DIR：库和可执行的最终存放目录
#PROJECT_NAME：你猜~~
#四、cmake中调用环境变量
#1.Using $ENV{NAME} : invoke system environment varible.
#We can use "SET(ENV{NAME} value)" as well. note that the "ENV" without "$".
#2.CMAKE_INCLUDE_CURRENT_DIR equal to INCLUDE_DIRECTORY(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
#五、其他的内置变量
#1.BUILD_SHARED_LIBS:set the default value when using ADD_LIBRARY()
#2.CMAKE_C_FLAGS: set compiler for c language
#2.CMAKE_CXX_FLAGS: set compiler for c++ language
#六、区分debug和release
#在工程目录下，cmake -DCMAKE__BUILD_TYPE=DEBUG(RELEASE)，再执行make
#或在CMakeLists.txt中SET(CMAKE__BUILD_TYPE Debug)

#编译选项说明
#-o0 不优化  -o3 最大优化
#-Wall 显示警告
#-Wall -W 显示所有警告
#-Wall -Werror 警告转为错误
#-g 编译时产生调试信息
#-ggdb 编译时尽可能产生gdb调试信息
#-std=c++0x 或者-std=c++11 对c++11的支持
#-lrt real time 支持库
#-m32 -m64 指定编译32bit或64bit程序


