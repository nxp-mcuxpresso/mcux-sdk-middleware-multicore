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


#if ERPC_ALLOCATION_POLICY == ERPC_ALLOCATION_POLICY_DYNAMIC
#include "erpc_port.h"
#endif
#include "erpc_codec.hpp"
#include "erpc_two_way_rpc_Core1Interface_client.hpp"
#include "erpc_manually_constructed.hpp"

#if 11200 != ERPC_VERSION_NUMBER
#error "The generated shim code version is different to the rest of eRPC code."
#endif

using namespace erpc;
using namespace std;
using namespace erpcShim;



Core1Interface_client::Core1Interface_client(ClientManager *manager)
:m_clientManager(manager)
{
}

Core1Interface_client::~Core1Interface_client()
{
}

// Core1Interface interface increaseNumber function client shim.
void Core1Interface_client::increaseNumber(uint32_t * number)
{
    erpc_status_t err = kErpcStatus_Success;


#if ERPC_PRE_POST_ACTION
    pre_post_action_cb preCB = m_clientManager->getPreCB();
    if (preCB)
    {
        preCB();
    }
#endif

    // Get a new request.
    RequestContext request = m_clientManager->createRequest(false);

    // Encode the request.
    Codec * codec = request.getCodec();

    if (codec == NULL)
    {
        err = kErpcStatus_MemoryError;
    }
    else
    {
        codec->startWriteMessage(message_type_t::kInvocationMessage, m_serviceId, m_increaseNumberId, request.getSequence());

        codec->write(*number);

        // Send message to server
        // Codec status is checked inside this function.
        m_clientManager->performRequest(request);

        codec->read(*number);

        err = codec->getStatus();
    }

    // Dispose of the request.
    m_clientManager->releaseRequest(request);

    // Invoke error handler callback function
    m_clientManager->callErrorHandler(err, m_increaseNumberId);

#if ERPC_PRE_POST_ACTION
    pre_post_action_cb postCB = m_clientManager->getPostCB();
    if (postCB)
    {
        postCB();
    }
#endif


    return;
}
