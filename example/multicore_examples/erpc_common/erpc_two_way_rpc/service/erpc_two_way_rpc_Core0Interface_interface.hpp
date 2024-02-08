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


#if !defined(_erpc_two_way_rpc_Core0Interface_interface_hpp_)
#define _erpc_two_way_rpc_Core0Interface_interface_hpp_

#include "erpc_two_way_rpc_Core0Interface_common.hpp"

namespace erpcShim
{


// Abstract base class for Core0Interface
class Core0Interface_interface
{
    public:
        typedef void (Core0Interface_interface::*getNumberCallback_t)(uint32_t * param1);

        static const uint8_t m_serviceId = 1;
        static const uint8_t m_setGetNumberFunctionId = 1;
        static const uint8_t m_getGetNumberFunctionId = 2;
        static const uint8_t m_nestedCallGetNumberId = 3;
        static const uint8_t m_getNumberFromCore1Id = 4;

        virtual ~Core0Interface_interface(void);

        /*! Sets callback function. To the other side. Implementation on Core1  */
        virtual void setGetNumberFunction(const getNumberCallback_t getNumberCallbackParam) = 0;

        /*! Gets callback function. Implementation on Core1  */
        virtual void getGetNumberFunction(getNumberCallback_t * getNumberCallbackParam) = 0;

        /*! Sets callback function. To the other side. Implementation on Core1  */
        virtual void nestedCallGetNumber(const getNumberCallback_t getNumberCallbackParam) = 0;

        /*! Callback function. Implementation on Core1 */
        virtual void getNumberFromCore1(uint32_t * number) = 0;

       static bool get_callbackAddress_getNumberCallback_t(uint16_t index, getNumberCallback_t *callback);
       static bool get_callbackIdx_getNumberCallback_t(const getNumberCallback_t *callback, uint16_t &index);
private:
        static getNumberCallback_t _getNumberCallback_t[1];
};
} // erpcShim


#endif // _erpc_two_way_rpc_Core0Interface_interface_hpp_