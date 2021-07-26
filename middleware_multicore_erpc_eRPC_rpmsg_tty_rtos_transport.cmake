#Description: eRPC RPMsg-Lite TTY RTOS transport layer; user_visible: True
include_guard(GLOBAL)
message("middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_transport component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/transports/erpc_rpmsg_tty_rtos_transport.cpp
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/setup/erpc_setup_mbf_rpmsg_tty.cpp
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/port/erpc_threading_freertos.cpp
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/infra/erpc_framed_transport.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/infra
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/port
    ${CMAKE_CURRENT_LIST_DIR}/erpc/erpc_c/transports
)


include(middleware_multicore_erpc_common)
