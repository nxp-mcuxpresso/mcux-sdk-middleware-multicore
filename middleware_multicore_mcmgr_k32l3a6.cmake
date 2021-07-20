#Description: Multicore Manager for frdmk32l3a6 board; user_visible: True
include_guard(GLOBAL)
message("middleware_multicore_mcmgr_k32l3a6 component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/mcmgr/src/mcmgr_internal_core_api_k32l3a6.c
    ${CMAKE_CURRENT_LIST_DIR}/mcmgr/src/mcmgr_mu_internal.c
)


target_include_directories(${MCUX_SDK_PROJECT_NAME} PRIVATE
)


include(middleware_multicore_mcmgr)
include(driver_mu)
