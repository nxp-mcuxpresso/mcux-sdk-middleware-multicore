#Description: Remote Procedure Messaging Lite porting layer for evkmimxrt685 board; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_rpmsg_lite_evkmimxrt685_bm component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/include/platform/imxrt600_m33
)


