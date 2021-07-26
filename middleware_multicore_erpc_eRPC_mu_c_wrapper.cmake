#Description: eRPC Messaging Unit C Wrapper; user_visible: True
include_guard(GLOBAL)
message("middleware_multicore_erpc_eRPC_mu_c_wrapper component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/setup/erpc_setup_mu.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)


include(middleware_multicore_erpc_common)
