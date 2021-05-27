/*
 * Copyright 2020 NXP
 * All rights reserved.
 *
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_device_registers.h"
#include "fsl_imu.h"
#include "mcmgr.h"
#include "mcmgr_internal_core_api.h"

#define IMU_ISR_COUNT (2U)

#if defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 1U)
#define MUA (CIU2_Type *)CIU2_BASE
#elif defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 2U)
#define MUB (CIU2_Type *)CIU2_BASE
#endif

/* Weak MU ISR stubs */
/* implement these in your application to override */

void MU_TxEmptyFlagISR(void);
void MU_RxFullFlagISR(void);

__attribute__((weak)) void MU_TxEmptyFlagISR(void){};
__attribute__((weak)) void MU_RxFullFlagISR(void){};

/* MU ISR table */
void (*const MU_interrupts[IMU_ISR_COUNT])(void) = {
    MU_TxEmptyFlagISR,
    MU_RxFullFlagISR,
};

/* MU ISR router */
static void imu_rx_isr(CIU2_Type *base)
{
    MU_RxFullFlagISR();
#if defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 1U)
    IMU_ClearPendingInterrupts(base, kIMU_LinkCpu1Cpu2, IMU_MSG_FIFO_CNTL_MSG_RDY_INT_CLR_MASK);
#elif defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 2U)
    IMU_ClearPendingInterrupts(base, kIMU_LinkCpu2Cpu1, IMU_MSG_FIFO_CNTL_MSG_RDY_INT_CLR_MASK);
#endif
}

#if defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 1U)
int32_t RF_IMU_IRQHandler(void)
{
    imu_rx_isr(MUA);
    SDK_ISR_EXIT_BARRIER;
    return 0;
}
#endif

#if defined(IMU_CPU_INDEX) && (IMU_CPU_INDEX == 2U)
int32_t CPU2_MSG_RDY_INT_IRQHandler(void)
{
    imu_rx_isr(MUB);
    SDK_ISR_EXIT_BARRIER;
    return 0;
}
#endif /* IMU_CPU_INDEX */
