# Copyright (C) 2017 
# Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
#
# This file is part of the numerical analysis lecture CE3102 at TEC
# Author: Pablo Alvarado
# Date  : 28.12.2017



find_package (Boost COMPONENTS system filesystem REQUIRED)
include_directories (${CMAKE_SOURCE_DIR}/include ${Boost_INCLUDE_DIRS})


#find_package(BLAS)
#include_directories (${CMAKE_SOURCE_DIR}/include ${BLAS})

find_package (LAPACK)
include_directories (${CMAKE_SOURCE_DIR}/include ${LAPACK})



#find_package (LAPACKE)
#include_directories (${CMAKE_SOURCE_DIR}/include ${LAPACKE})




#if (NOT LAPACKE_FOUND)
#    set(LAPACKE_DIR "" CACHE PATH "${CMAKE_SOURCE_DIR}/include ${LAPACKE}")
#    if (NOT LAPACKE_FIND_QUIETLY)
#        message(STATUS "A cache variable, namely LAPACKE_DIR, has been set to specify the install directory of LAPACKE")
#    endif()
#endif()




file(GLOB SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)
file(GLOB HEADERS RELATIVE ${CMAKE_SOURCE_DIR}/include *.?pp *.h)

list(REMOVE_ITEM SRCS "main.cpp")

set (CMAKE_CXX_STANDARD 11)

set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

include(CheckIncludeFiles)

option(ANPI_ENABLE_SIMD "Force the use of optimized code instead of generic" on)

if(MSVC)
  # Force to always compile with W4
  if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
    string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
  endif()
elseif(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
  # Update if necessary
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-long-long -pedantic")
  # Specify best possible CPU architecture for available hardware
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
endif()

find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/cmake/AnpiConfig.hpp.in ${CMAKE_SOURCE_DIR}/include/AnpiConfig.hpp)

add_library(anpi STATIC ${SRCS} ${HEADERS} ../include/RandomSymmetricSqr.hpp ../include/eig.hpp)
add_executable(tarea03 main.cpp)
target_link_libraries(tarea03 anpi python2.7 lapack lapacke blas)
