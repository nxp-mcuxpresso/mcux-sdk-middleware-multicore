#Description: Remote Procedure Messaging Lite porting layer for lpcxpresso54114 board; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_rpmsg_lite_lpc5411x_freertos component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/platform/lpc5411x/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/include/platform/lpc5411x
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "LPC54114_cm0plus")
    include(middleware_multicore_rpmsg_lite_LPC54114_cm0plus)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54114_cm4")
    include(middleware_multicore_rpmsg_lite_LPC54114_cm4)
endif()

include(middleware_freertos-kernel_heap_3)
