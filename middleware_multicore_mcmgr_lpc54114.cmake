#Description: Multicore Manager for lpcxpresso54114 board; user_visible: True
include_guard(GLOBAL)
message("middleware_multicore_mcmgr_lpc54114 component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/mcmgr/src/mcmgr_internal_core_api_lpc54114.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)


include(driver_mailbox)
include(middleware_multicore_mcmgr)
