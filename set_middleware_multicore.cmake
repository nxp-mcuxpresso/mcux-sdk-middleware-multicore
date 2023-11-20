include_guard(GLOBAL)


if (CONFIG_USE_middleware_multicore)
# Add set(CONFIG_USE_middleware_multicore true) in config.cmake to use this component

message("middleware_multicore component is included from ${CMAKE_CURRENT_LIST_FILE}.")


endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_baremetal)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_bm.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/environment/bm
)


endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_freertos-kernel)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_freertos.c
      ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/rpmsg_queue.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/environment/freertos
)


endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_xos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_xos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_xos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/environment/rpmsg_env_xos.c
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/rpmsg_queue.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/environment/xos
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DFSL_RTOS_XOS=1
  )

endif()


endif()


if (CONFIG_USE_middleware_multicore_remoteproc_loadscript)
# Add set(CONFIG_USE_middleware_multicore_remoteproc_loadscript true) in config.cmake to use this component

message("middleware_multicore_remoteproc_loadscript component is included from ${CMAKE_CURRENT_LIST_FILE}.")


endif()


if (CONFIG_USE_middleware_multicore_erpc_common)
# Add set(CONFIG_USE_middleware_multicore_erpc_common true) in config.cmake to use this component

message("middleware_multicore_erpc_common component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(((CONFIG_DEVICE_ID STREQUAL MIMXRT1165xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB) OR (CONFIG_BOARD STREQUAL frdmk22f OR CONFIG_BOARD STREQUAL frdmk32l2b OR CONFIG_BOARD STREQUAL evkmcimx7ulp OR CONFIG_BOARD STREQUAL frdmk32l3a6 OR CONFIG_BOARD STREQUAL lpcxpresso55s69 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt685 OR CONFIG_BOARD STREQUAL evkmimxrt1060)))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_basic_codec.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_message_buffer.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_message_loggers.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_crc16.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_pre_post_action.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  if(CONFIG_TOOLCHAIN STREQUAL iar)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
      --enable_restrict
    )
  endif()

endif()

else()

message(SEND_ERROR "middleware_multicore_erpc_common dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_arbitrator)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_arbitrator true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_arbitrator component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_arbitrated_client_manager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_client_manager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_arbitrated_client_setup.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_simple_server.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_server.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_server_setup.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_transport_arbitrator.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_threading_freertos.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_arbitrator dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_client)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_client true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_client component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_client_manager.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_client_setup.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_client dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_server)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_server true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_server component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_simple_server.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_server.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_server_setup.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_server dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_remote_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_remote_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_remote_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_rpmsg_tty_rtos_remote.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_remote_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_mu_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_mu_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_mu_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mu.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_mu_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_master_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_master_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_master_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_rpmsg_lite_master.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_master_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_remote_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_remote_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_remote_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_rpmsg_lite_remote.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_remote_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_master_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_master_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_master_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_rpmsg_lite_rtos_master.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_master_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_remote_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_remote_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_remote_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_rpmsg_lite_rtos_remote.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_remote_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_master_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_master_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_dspi_master_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_dspi_master.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_dspi_master_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_slave_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_slave_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_dspi_slave_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_dspi_slave.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_dspi_slave_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_spi_master_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_spi_master_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_spi_master_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_spi_master.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_spi_master_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_spi_slave_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_spi_slave_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_spi_slave_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_spi_slave.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_spi_slave_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_lpspi_slave_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_lpspi_slave_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_lpspi_slave_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_lpspi_slave.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_lpspi_slave_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_i2c_slave_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_i2c_slave_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_i2c_slave_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_i2c_slave.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_i2c_slave_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_lpi2c_slave_c_wrapper)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_lpi2c_slave_c_wrapper true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_lpi2c_slave_c_wrapper component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_lpi2c_slave.cpp
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_lpi2c_slave_c_wrapper dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_mu_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_mu_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_mu_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_mu_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_mu_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_mu_rtos_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_mu_rtos_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_mu_rtos_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_mu_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_threading_freertos.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_mu_rtos_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_rpmsg_lite_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_rpmsg.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_rpmsg_lite_rtos_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_rpmsg.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_lite_rtos_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_rpmsg_tty_rtos_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_rpmsg_tty.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_threading_freertos.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_rpmsg_tty_rtos_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_uart_cmsis_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_uart_cmsis_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_uart_cmsis_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_uart_cmsis_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_uart_cmsis.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_uart_cmsis_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_master_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_master_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_dspi_master_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_dspi_master_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_dspi_master_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_slave_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_dspi_slave_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_dspi_slave_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_dspi_slave_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_dspi_slave_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_spi_master_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_spi_master_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_spi_master_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_spi_master_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_spi_master_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_spi_slave_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_spi_slave_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_spi_slave_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_spi_slave_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_spi_slave_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_lpspi_slave_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_lpspi_slave_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_lpspi_slave_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_lpspi_slave_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_lpspi_slave_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_i2c_slave_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_i2c_slave_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_i2c_slave_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_i2c_slave_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_i2c_slave_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_lpi2c_slave_transport)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_lpi2c_slave_transport true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_lpi2c_slave_transport component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports/erpc_lpi2c_slave_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra/erpc_framed_transport.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/setup/erpc_setup_mbf_dynamic.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/transports
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/infra
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_lpi2c_slave_transport dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_port_freertos)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_port_freertos true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_port_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_port_freertos.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_threading_freertos.cpp
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_setup_extensions_freertos.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_port_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_eRPC_port_stdlib)
# Add set(CONFIG_USE_middleware_multicore_erpc_eRPC_port_stdlib true) in config.cmake to use this component

message("middleware_multicore_erpc_eRPC_port_stdlib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port/erpc_port_stdlib.cpp
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./erpc/erpc_c/port
)

else()

message(SEND_ERROR "middleware_multicore_erpc_eRPC_port_stdlib dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc_doc)
# Add set(CONFIG_USE_middleware_multicore_erpc_doc true) in config.cmake to use this component

message("middleware_multicore_erpc_doc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_erpc_common)

else()

message(SEND_ERROR "middleware_multicore_erpc_doc dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_erpc)
# Add set(CONFIG_USE_middleware_multicore_erpc true) in config.cmake to use this component

message("middleware_multicore_erpc component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(((CONFIG_DEVICE_ID STREQUAL MIMXRT1165xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxA OR CONFIG_DEVICE_ID STREQUAL MIMXRT1062xxxxB) OR (CONFIG_BOARD STREQUAL frdmk22f OR CONFIG_BOARD STREQUAL frdmk32l2b OR CONFIG_BOARD STREQUAL evkmcimx7ulp OR CONFIG_BOARD STREQUAL frdmk32l3a6 OR CONFIG_BOARD STREQUAL lpcxpresso55s69 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170 OR CONFIG_BOARD STREQUAL evkmimxrt685 OR CONFIG_BOARD STREQUAL evkmimxrt1060)))

else()

message(SEND_ERROR "middleware_multicore_erpc dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_mcmgr)
# Add set(CONFIG_USE_middleware_multicore_mcmgr true) in config.cmake to use this component

message("middleware_multicore_mcmgr component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(((CONFIG_DEVICE_ID STREQUAL MIMXRT1165xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx) OR (CONFIG_BOARD STREQUAL frdmk32l3a6 OR CONFIG_BOARD STREQUAL lpcxpresso55s69 OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170)))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DMULTICORE_APP=1
  )

endif()

else()

message(SEND_ERROR "middleware_multicore_mcmgr dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_mcmgr_k32l3a6)
# Add set(CONFIG_USE_middleware_multicore_mcmgr_k32l3a6 true) in config.cmake to use this component

message("middleware_multicore_mcmgr_k32l3a6 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_mcmgr AND CONFIG_USE_driver_mu AND (CONFIG_BOARD STREQUAL frdmk32l3a6))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_internal_core_api_k32l3a6.c
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_mu_internal.c
)

else()

message(SEND_ERROR "middleware_multicore_mcmgr_k32l3a6 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_k32l3a6_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL frdmk32l3a6))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/k32l3a6/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/k32l3a6
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_k32l3a6_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_k32l3a6_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL frdmk32l3a6) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/k32l3a6/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/k32l3a6
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_k32l3a6_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_k32l3a6)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_k32l3a6 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config_k32l3a6 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_bm AND CONFIG_USE_middleware_multicore_mcmgr_k32l3a6 AND (CONFIG_BOARD STREQUAL frdmk32l3a6) AND CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config_k32l3a6 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_k32l3a6)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_k32l3a6 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config_k32l3a6 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_freertos AND CONFIG_USE_middleware_multicore_mcmgr_k32l3a6 AND (CONFIG_BOARD STREQUAL frdmk32l3a6) AND CONFIG_USE_middleware_multicore_rpmsg_lite_k32l3a6_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config_k32l3a6 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(((CONFIG_DEVICE_ID STREQUAL MIMXRT1165xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1173xxxxx OR CONFIG_DEVICE_ID STREQUAL MIMXRT1175xxxxx) OR (CONFIG_BOARD STREQUAL frdmk32l3a6 OR CONFIG_BOARD STREQUAL evkmcimx7ulp OR CONFIG_BOARD STREQUAL evkmimx8mq OR CONFIG_BOARD STREQUAL evkmimxrt685 OR CONFIG_BOARD STREQUAL mimxrt685audevk OR CONFIG_BOARD STREQUAL evkmimxrt595 OR CONFIG_BOARD STREQUAL lpcxpresso55s69 OR CONFIG_BOARD STREQUAL evkmimx8mm OR CONFIG_BOARD STREQUAL evkmimx8mn OR CONFIG_BOARD STREQUAL evkmimx8mnddr3l OR CONFIG_BOARD STREQUAL evkmimx8mp OR CONFIG_BOARD STREQUAL evkmimxrt1160 OR CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170)) AND (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos OR CONFIG_USE_middleware_multicore_rpmsg_lite_bm OR CONFIG_USE_middleware_multicore_rpmsg_lite_xos))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/common/llist.c
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/rpmsg_lite.c
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/rpmsg_ns.c
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/virtio/virtqueue.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mp_m7_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mp))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mp_m7/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mp_m7
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mp_m7_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mp_m7_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mp) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mp_m7/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mp_m7
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mp_m7_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND (CONFIG_BOARD STREQUAL evkmimx8mp) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND (CONFIG_BOARD STREQUAL evkmimx8mp) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mp_m7_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt595_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt595))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt500_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt500_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt595_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_fusionf1_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_fusionf1_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt595_fusionf1_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt595))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt500_fusionf1/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt500_fusionf1
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt595_fusionf1_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt595_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt595_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt595) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt500_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt500_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt595_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt685_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt685))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt685_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_hifi4_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_hifi4_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt685_hifi4_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt685))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_hifi4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_hifi4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt685_hifi4_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_evkmimxrt685_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_evkmimxrt685_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt685) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_evkmimxrt685_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_mimxrt685audevk_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL mimxrt685audevk))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_mimxrt685audevk_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_hifi4_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_hifi4_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_mimxrt685audevk_hifi4_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL mimxrt685audevk))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_hifi4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_hifi4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_mimxrt685audevk_hifi4_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_mimxrt685audevk_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_mimxrt685audevk_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL mimxrt685audevk) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt600_m33/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt600_m33
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_mimxrt685audevk_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mn_m7_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mn_m7_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mn_m7_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mn OR CONFIG_BOARD STREQUAL evkmimx8mnddr3l))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mn_m7/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mn_m7
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mn_m7_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mn_m7_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mn_m7_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mn_m7_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mn OR CONFIG_BOARD STREQUAL evkmimx8mnddr3l) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mn_m7/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mn_m7
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mn_m7_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mq_m4_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mq_m4_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mq_m4_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mq))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mq_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mq_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mq_m4_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mq_m4_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mq_m4_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mq_m4_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mq) AND CONFIG_USE_middleware_freertos-kernel)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mq_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mq_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mq_m4_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_mcmgr_imxrt1170)
# Add set(CONFIG_USE_middleware_multicore_mcmgr_imxrt1170 true) in config.cmake to use this component

message("middleware_multicore_mcmgr_imxrt1170 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_mcmgr AND CONFIG_USE_driver_mu AND (CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_internal_core_api_imxrt1170.c
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_mu_internal.c
)

else()

message(SEND_ERROR "middleware_multicore_mcmgr_imxrt1170 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imxrt1170_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt1170/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt1170
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imxrt1170_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imxrt1170_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt1170/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt1170
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imxrt1170_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imxrt1170)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imxrt1170 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config_imxrt1170 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_bm AND CONFIG_USE_middleware_multicore_mcmgr_imxrt1170 AND (CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config_imxrt1170 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imxrt1170)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imxrt1170 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config_imxrt1170 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_freertos AND CONFIG_USE_middleware_multicore_mcmgr_imxrt1170 AND (CONFIG_BOARD STREQUAL evkmimxrt1170 OR CONFIG_BOARD STREQUAL evkbmimxrt1170) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1170_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config_imxrt1170 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx7ulp_m4_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmcimx7ulp))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx7ulp_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx7ulp_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx7ulp_m4_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx7ulp_m4_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmcimx7ulp) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx7ulp_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx7ulp_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx7ulp_m4_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imx7ulp_m4)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imx7ulp_m4 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config_imx7ulp_m4 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_bm AND (CONFIG_BOARD STREQUAL evkmcimx7ulp) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config_imx7ulp_m4 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imx7ulp_m4)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imx7ulp_m4 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config_imx7ulp_m4 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_freertos AND (CONFIG_BOARD STREQUAL evkmcimx7ulp) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imx7ulp_m4_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config_imx7ulp_m4 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_mcmgr_imxrt1160)
# Add set(CONFIG_USE_middleware_multicore_mcmgr_imxrt1160 true) in config.cmake to use this component

message("middleware_multicore_mcmgr_imxrt1160 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_mcmgr AND CONFIG_USE_driver_mu AND (CONFIG_BOARD STREQUAL evkmimxrt1160))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_internal_core_api_imxrt1160.c
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_mu_internal.c
)

else()

message(SEND_ERROR "middleware_multicore_mcmgr_imxrt1160 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imxrt1160_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt1160))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt1160/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt1160
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imxrt1160_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imxrt1160_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimxrt1160) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imxrt1160/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imxrt1160
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imxrt1160_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imxrt1160)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_imxrt1160 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config_imxrt1160 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_bm AND CONFIG_USE_middleware_multicore_mcmgr_imxrt1160 AND (CONFIG_BOARD STREQUAL evkmimxrt1160) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config_imxrt1160 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imxrt1160)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_imxrt1160 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config_imxrt1160 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_freertos AND CONFIG_USE_middleware_multicore_mcmgr_imxrt1160 AND (CONFIG_BOARD STREQUAL evkmimxrt1160) AND CONFIG_USE_middleware_multicore_rpmsg_lite_imxrt1160_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config_imxrt1160 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mm_m4_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mm_m4_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mm_m4_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mm))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mm_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mm_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mm_m4_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mm_m4_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_imx8mm_m4_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_imx8mm_m4_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL evkmimx8mm) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/imx8mm_m4/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/imx8mm_m4
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_imx8mm_m4_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_mcmgr_lpc55s69)
# Add set(CONFIG_USE_middleware_multicore_mcmgr_lpc55s69 true) in config.cmake to use this component

message("middleware_multicore_mcmgr_lpc55s69 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_mcmgr AND CONFIG_USE_driver_mailbox)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./mcmgr/src/mcmgr_internal_core_api_lpc55s69.c
)

else()

message(SEND_ERROR "middleware_multicore_mcmgr_lpc55s69 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_bm)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_bm true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_lpcxpresso55s69_bm component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL lpcxpresso55s69))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/lpc55s69/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/lpc55s69
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_lpcxpresso55s69_bm dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_freertos)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_freertos true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_lpcxpresso55s69_freertos component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_BOARD STREQUAL lpcxpresso55s69) AND CONFIG_USE_middleware_freertos-kernel AND CONFIG_USE_middleware_freertos-kernel_heap_4)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/rpmsg_lite/porting/platform/lpc55s69/rpmsg_platform.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/lib/include/platform/lpc55s69
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_lpcxpresso55s69_freertos dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_lpcxpresso55s69)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_bm_config_lpcxpresso55s69 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_bm_config_lpcxpresso55s69 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_bm AND CONFIG_USE_middleware_multicore_mcmgr_lpc55s69 AND (CONFIG_BOARD STREQUAL lpcxpresso55s69) AND CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_bm)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_bm_config_lpcxpresso55s69 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_lpcxpresso55s69)
# Add set(CONFIG_USE_middleware_multicore_rpmsg_lite_freertos_config_lpcxpresso55s69 true) in config.cmake to use this component

message("middleware_multicore_rpmsg_lite_freertos_config_lpcxpresso55s69 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_multicore_rpmsg_lite AND CONFIG_USE_middleware_multicore_rpmsg_lite_freertos AND CONFIG_USE_middleware_multicore_mcmgr_lpc55s69 AND (CONFIG_BOARD STREQUAL lpcxpresso55s69) AND CONFIG_USE_middleware_multicore_rpmsg_lite_lpcxpresso55s69_freertos)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./rpmsg_lite/template_application
)

else()

message(SEND_ERROR "middleware_multicore_rpmsg_lite_freertos_config_lpcxpresso55s69 dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()

