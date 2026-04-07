/* AstraRTOS - Startup code for STM32F429ZI */

.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.section .isr_vector, "a", %progbits    /* vector table */
.global _vector_table

_vector_table:
    .word _estack            /* 0x00: Initial stack pointer */
    .word Reset_Handler      /* 0x04: Reset - entry point */
    .word NMI_Handler        /* 0x08: Non-maskable interrupt */
    .word HardFault_Handler  /* 0x0C: Hard fault */
    .word MemManage_Handler  /* 0x10: Memory management fault */
    .word BusFault_Handler   /* 0x14: Bus fault */
    .word UsageFault_Handler /* 0x18: Usage fault */
    .word 0                  /* 0x1C: Reserved */
    .word 0                  /* 0x20: Reserved */
    .word 0                  /* 0x24: Reserved */
    .word 0                  /* 0x28: Reserved */
    .word SVC_Handler        /* 0x2C: Supervisor call */
    .word 0                  /* 0x30: Reserved */
    .word 0                  /* 0x34: Reserved */
    .word PendSV_Handler     /* 0x38: PendSV - context switch */
    .word SysTick_Handler    /* 0x3C: SysTick -  RTOS tick */


.section .text                  /* reset handler */
.global Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    /* Copy .data from the flash to SRAM */
    ldr r0, =_sdata
    ldr r1, =_edata
    ldr r2, =_sidata

copy_data:
    cmp r0, r1
    bge done_data
    ldr r3, [r2], #4
    str r3, [r0], #4
    b copy_data

done_data:
    /* Step 2: Zero out .bss */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0

zero_bss:
    cmp r0, r1
    bge done_bss
    str r2, [r0], #4
    b zero_bss

done_bss:
    /* call the main kernel */
    bl main

hang:
    b hang

/* to be defined in C later */
.weak NMI_Handler
.weak HardFault_Handler
.weak MemManage_Handler
.weak BusFault_Handler
.weak UsageFault_Handler
.weak SVC_Handler
.weak PendSV_Handler
.weak SysTick_Handler

NMI_Handler:
HardFault_Handler:
MemManage_Handler:
BusFault_Handler:
UsageFault_Handler:
SVC_Handler:
PendSV_Handler:
SysTick_Handler:
    b .
