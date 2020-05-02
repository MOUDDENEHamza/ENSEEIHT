// ----------------------------------------------------------------------------
//     FILE NAME : nxt_config.h
//
//     ABSTRACT  : NXT device configuration
//
// Written by O. Cots (2015) - INP-ENSEEIHT-IRIT
// Updated from Selove Oke Codjo, Imane Regragui, Samy Hamlaoui, 
// Soukiena Oubih, Sovanna Thai
// "projet long" deliverables.
// ----------------------------------------------------------------------------

#ifndef _NXT_CONFIG_H_
#define _NXT_CONFIG_H_

#include "ecrobot_interface.h"

/* NXT motor port configuration */
#define PORT_MOTOR_L NXT_PORT_C
#define PORT_MOTOR_R NXT_PORT_B

/* NXT sensor port configuration */
#define PORT_GYRO NXT_PORT_S4

/* Conversion Constants */
#define DEG2RAD 0.0175
#define RAD2DEG 57.2958

#define PI 3.14159265359

/* PWM limitation */
#define PWMMAX 90.0

/* NXT motors synchronisation Constants */
#define K_SYNC 17.5

/* NXT voltage constants  Vmotor = Vbattery * V_COEFF + V_OFFSET */
#define V_COEFF 1.089
#define V_OFFSET 0.625

#endif
