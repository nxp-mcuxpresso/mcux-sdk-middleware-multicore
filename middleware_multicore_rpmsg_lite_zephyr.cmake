#Description: RPMsg-Lite Zephyr environment layer sources; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_rpmsg_lite_zephyr component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

if(CONFIG_USE_middleware_zephyr-kernel)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_zephyr.c
)
endif()

if(CONFIG_USE_middleware_zephyr-kernel)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/rpmsg_queue.c
)
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/include/environment/zephyr
)
