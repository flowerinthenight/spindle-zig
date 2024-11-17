# For building cpp/bindings only.

cmake_minimum_required(VERSION 3.14)
project(spindle)

find_package(protobuf REQUIRED CONFIG)

add_definitions(-w)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(sources ${CMAKE_SOURCE_DIR}/cpp/bindings.cpp
            ${CMAKE_SOURCE_DIR}/cpp/main.cpp)

link_directories(${CMAKE_SOURCE_DIR}/deps/usr/lib)
add_executable(spindle ${sources})

target_include_directories(spindle
                           PUBLIC cpp
                                  google-cloud-cpp
                                  deps/usr/include
                                  google-cloud-cpp/out/external/googleapis
                                  google-cloud-cpp/out/google/cloud/spanner)

target_link_libraries(spindle
                      PUBLIC absl_bad_any_cast_impl
                             absl_bad_optional_access
                             absl_bad_variant_access
                             absl_base
                             absl_city
                             absl_civil_time
                             absl_cord
                             absl_cord_internal
                             absl_cordz_functions
                             absl_cordz_handle
                             absl_cordz_info
                             absl_cordz_sample_token
                             absl_crc32c
                             absl_crc_cord_state
                             absl_crc_cpu_detect
                             absl_crc_internal
                             absl_debugging_internal
                             absl_decode_rust_punycode
                             absl_demangle_internal
                             absl_demangle_rust
                             absl_die_if_null
                             absl_examine_stack
                             absl_exponential_biased
                             absl_failure_signal_handler
                             absl_flags_commandlineflag
                             absl_flags_commandlineflag_internal
                             absl_flags_config
                             absl_flags_internal
                             absl_flags_marshalling
                             absl_flags_parse
                             absl_flags_private_handle_accessor
                             absl_flags_program_name
                             absl_flags_reflection
                             absl_flags_usage
                             absl_flags_usage_internal
                             absl_graphcycles_internal
                             absl_hash
                             absl_hashtablez_sampler
                             absl_int128
                             absl_kernel_timeout_internal
                             absl_leak_check
                             absl_log_entry
                             absl_log_flags
                             absl_log_globals
                             absl_log_initialize
                             absl_log_internal_check_op
                             absl_log_internal_conditions
                             absl_log_internal_fnmatch
                             absl_log_internal_format
                             absl_log_internal_globals
                             absl_log_internal_log_sink_set
                             absl_log_internal_message
                             absl_log_internal_nullguard
                             absl_log_internal_proto
                             absl_log_severity
                             absl_log_sink
                             absl_low_level_hash
                             absl_malloc_internal
                             absl_periodic_sampler
                             absl_poison
                             absl_random_distributions
                             absl_random_internal_distribution_test_util
                             absl_random_internal_platform
                             absl_random_internal_pool_urbg
                             absl_random_internal_randen
                             absl_random_internal_randen_hwaes
                             absl_random_internal_randen_hwaes_impl
                             absl_random_internal_randen_slow
                             absl_random_internal_seed_material
                             absl_random_seed_gen_exception
                             absl_random_seed_sequences
                             absl_raw_hash_set
                             absl_raw_logging_internal
                             absl_scoped_set_env
                             absl_spinlock_wait
                             absl_stacktrace
                             absl_status
                             absl_statusor
                             absl_strerror
                             absl_str_format_internal
                             absl_strings
                             absl_strings_internal
                             absl_string_view
                             absl_symbolize
                             absl_synchronization
                             absl_throw_delegate
                             absl_time
                             absl_time_zone
                             absl_utf8_for_code_point
                             absl_vlog_config_internal
                             address_sorting
                             crc32c
                             gpr
                             grpc++
                             grpc
                             grpc++_alts
                             grpc_authorization_provider
                             grpc++_error_details
                             grpc_plugin_support
                             grpcpp_channelz
                             grpc++_reflection
                             grpc++_unsecure
                             grpc_unsecure
                             opentelemetry_common
                             opentelemetry_exporter_in_memory
                             opentelemetry_exporter_in_memory_metric
                             opentelemetry_exporter_ostream_logs
                             opentelemetry_exporter_ostream_metrics
                             opentelemetry_exporter_ostream_span
                             opentelemetry_logs
                             opentelemetry_metrics
                             opentelemetry_resources
                             opentelemetry_trace
                             opentelemetry_version
                             protobuf
                             protobuf-lite
                             protoc
                             upb
                             upb_base_lib
                             upb_json_lib
                             upb_mem_lib
                             upb_message_lib
                             upb_mini_descriptor_lib
                             upb_textformat_lib
                             upb_wire_lib
                             utf8_range
                             utf8_range_lib
                             utf8_validity)
