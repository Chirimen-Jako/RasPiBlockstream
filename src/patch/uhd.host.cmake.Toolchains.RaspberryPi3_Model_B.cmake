########################################################################
# Toolchain file for building native on a ARM Cortex A8 w/ NEON
# Usage: cmake -DCMAKE_TOOLCHAIN_FILE=<this file> <source directory>
########################################################################
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_C_COMPILER  gcc)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv7-a -mtune=cortex-a53 -mthumb -mfloat-abi=hard -mfpu=neon --param ggc-min-expand=1 --param ggc-min-heapsize=32768" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -march=armv7-a -mtune=cortex-a53 -mthumb -mfloat-abi=hard -mfpu=neon --param ggc-min-expand=1 --param ggc-min-heapsize=32768" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -march=armv7-a -mtune=cortex-a53 -mthumb -mfloat-abi=hard -mfpu=neon --param ggc-min-expand=1 --param ggc-min-heapsize=32768" CACHE STRING "" FORCE)

