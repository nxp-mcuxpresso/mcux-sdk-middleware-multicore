#Description: RPMsg-Lite baremetal environment layer sources; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_rpmsg_lite_bm component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

#OR Logic component
if(CONFIG_USE_middleware_baremetal)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1173_cm4)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1173_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1175_cm4)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1175_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1165_cm4)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1165_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
)
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/rpmsg_lite/lib/include/environment/bm
)


