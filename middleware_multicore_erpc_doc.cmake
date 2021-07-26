#Description: eRPC doc; user_visible: False
include_guard(GLOBAL)
message("middleware_multicore_erpc_doc component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)


include(middleware_multicore_erpc_common)
