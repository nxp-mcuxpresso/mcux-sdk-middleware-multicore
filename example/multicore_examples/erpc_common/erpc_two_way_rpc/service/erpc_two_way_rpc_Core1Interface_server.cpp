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


#include "erpc_two_way_rpc_Core1Interface_server.hpp"
#if ERPC_ALLOCATION_POLICY == ERPC_ALLOCATION_POLICY_DYNAMIC
#include <new>
#include "erpc_port.h"
#endif
#include "erpc_manually_constructed.hpp"

#if 11200 != ERPC_VERSION_NUMBER
#error "The generated shim code version is different to the rest of eRPC code."
#endif

using namespace erpc;
using namespace std;
using namespace erpcShim;

#if ERPC_NESTED_CALLS_DETECTION
extern bool nestingDetection;
#endif



Core1Interface_service::Core1Interface_service(Core1Interface_interface *_Core1Interface_interface)
    : erpc::Service(Core1Interface_interface::m_serviceId)
    , m_handler(_Core1Interface_interface)
{
}

Core1Interface_service::~Core1Interface_service()
{
}

// return service interface handler.
Core1Interface_interface* Core1Interface_service::getHandler(void)
{
    return m_handler;
}

// Call the correct server shim based on method unique ID.
erpc_status_t Core1Interface_service::handleInvocation(uint32_t methodId, uint32_t sequence, Codec * codec, MessageBufferFactory *messageFactory, Transport * transport)
{
    erpc_status_t erpcStatus;
    switch (methodId)
    {
        case Core1Interface_interface::m_increaseNumberId:
        {
            erpcStatus = increaseNumber_shim(codec, messageFactory, transport, sequence);
            break;
        }

        default:
        {
            erpcStatus = kErpcStatus_InvalidArgument;
            break;
        }
    }

    return erpcStatus;
}

// Server shim for increaseNumber of Core1Interface interface.
erpc_status_t Core1Interface_service::increaseNumber_shim(Codec * codec, MessageBufferFactory *messageFactory, Transport * transport, uint32_t sequence)
{
    erpc_status_t err = kErpcStatus_Success;

    uint32_t number;

    // startReadMessage() was already called before this shim was invoked.

    codec->read(number);

    err = codec->getStatus();
    if (err == kErpcStatus_Success)
    {
        // Invoke the actual served function.
#if ERPC_NESTED_CALLS_DETECTION
        nestingDetection = true;
#endif
        m_handler->increaseNumber(&number);
#if ERPC_NESTED_CALLS_DETECTION
        nestingDetection = false;
#endif

        // preparing MessageBuffer for serializing data
        err = messageFactory->prepareServerBufferForSend(codec->getBufferRef(), transport->reserveHeaderSize());
    }

    if (err == kErpcStatus_Success)
    {
        // preparing codec for serializing data
        codec->reset(transport->reserveHeaderSize());

        // Build response message.
        codec->startWriteMessage(message_type_t::kReplyMessage, Core1Interface_interface::m_serviceId, Core1Interface_interface::m_increaseNumberId, sequence);

        codec->write(number);

        err = codec->getStatus();
    }

    return err;
}
