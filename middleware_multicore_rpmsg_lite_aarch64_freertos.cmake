#Description: Remote Procedure Messaging Lite porting layer for AARCH64 platforms; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_rpmsg_lite_aarch64_freertos component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/platform/aarch64/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/include/platform/aarch64
)


include(middleware_freertos-kernel_heap_4)
