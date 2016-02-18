#当前目录
SET(local_dir ${CMAKE_CURRENT_LIST_DIR})
SET(local_build_name "demo")

#func_add_depends("printaaa")

#包含文件
INCLUDE_DIRECTORIES(.)

#源文件
AUX_SOURCE_DIRECTORY(. local_src_list)
#SET(local_src_list "a.cc")




#生成库
ADD_LIBRARY(${local_build_name} ${local_src_list})
#生成可执行文件
ADD_EXECUTABLE(${local_build_name} ${local_src_list})

#添加依赖库
TARGET_LINK_LIBRARIES(${local_build_name} ${local_depend_libs})
