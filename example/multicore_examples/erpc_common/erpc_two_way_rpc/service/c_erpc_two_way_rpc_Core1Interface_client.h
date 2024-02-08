/*
 * Copyright 2018,2023 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*
 * Generated by erpcgen 1.12.0 on Wed Oct 25 10:00:57 2023.
 *
 * AUTOGENERATED - DO NOT EDIT
 */


#if !defined(_c_erpc_two_way_rpc_Core1Interface_client_h_)
#define _c_erpc_two_way_rpc_Core1Interface_client_h_

#include "erpc_two_way_rpc_Core1Interface_common.h"
#include "erpc_client_manager.h"

#if defined(__cplusplus)
extern "C"
{
#endif

#if !defined(ERPC_FUNCTIONS_DEFINITIONS_CORE1INTERFACE)
#define ERPC_FUNCTIONS_DEFINITIONS_CORE1INTERFACE


/*! @brief Core1Interface identifiers */
enum _Core1Interface_ids
{
    kCore1Interface_service_id = 2,
    kCore1Interface_increaseNumber_id = 1,
};

/*! Core1 interface */
//! @name Core1Interface
//@{
/*! Function for increasing given number by 1. Implementation on Core0 */
void increaseNumber(uint32_t * number);
//@}

#endif // ERPC_FUNCTIONS_DEFINITIONS_CORE1INTERFACE

void initCore1Interface_client(erpc_client_t client);

void deinitCore1Interface_client(void);

#if defined(__cplusplus)
}
#endif

#endif // _c_erpc_two_way_rpc_Core1Interface_client_h_