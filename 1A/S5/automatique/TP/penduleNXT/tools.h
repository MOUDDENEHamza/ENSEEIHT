//-----------------------------------------------------------------------------
//      FILE NAME : tools.h
//
//      ABSTRACT  : header describing auxiliary methods used in the main file 
//                  (nxtSegway.c) and implemented in tools.c
//
// Written by O. Cots (2015) - INP-ENSEEIHT-IRIT
// Updated from Selove Oke Codjo, Imane Regragui, Samy Hamlaoui, 
// Soukiena Oubih, Sovanna Thai
// "projet long" deliverables.
// ----------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include "ecrobot_interface.h"

//-----------------------------------------------------------------------------
// FUNCTION    : init_time
// PARAMETERS  : (int) initial_time 
// RETURN      : none
// DESCRIPTION :
//               Initialize the time
//-----------------------------------------------------------------------------
void init_time(int initial_time);

//-----------------------------------------------------------------------------
// FUNCTION    : delta_t
// PARAMETERS  : none
// RETURN      :
//               (float) : the sample time
// DESCRIPTION :
//               This function computes the sample time 
//-----------------------------------------------------------------------------
float delta_t();

//-----------------------------------------------------------------------------
// FUNCTION    : getGyro
// PARAMETERS  :
//              (int) gyro_offset : the offset of the gyro sensor (deg/s)
// RETURN      :
//              (float) : the value given by the gyro sensor without the offset
// DESCRIPTION :
//              This function gets the value of the gyro sensor, substracts
//              the offset and returns the measure in radians
//-----------------------------------------------------------------------------
float getGyro(int gyro_offset);

//-----------------------------------------------------------------------------
// FUNCTION    : getMotorAngle
// PARAMETERS  : none
// RETURN      :
//              (float) : a motor count in radians
// DESCRIPTION :
//              This function gets the mean of the motor counts of the two wheel
//              and converts it in radians.
//-----------------------------------------------------------------------------
float getMotorAngle();

//-----------------------------------------------------------------------------
// FUNCTION    : nxt_motors_set_control
// PARAMETERS  : (float) u : command
// RETURN      : none
// DESCRIPTION :
//              This function provides the command to the nxt motors.
//-----------------------------------------------------------------------------
void nxt_motors_set_command(float u);

//-----------------------------------------------------------------------------
// FUNCTION    : calculatePWM
// PARAMETERS  :
//              (float) voltageR    : voltage to give to the right motor (Volt)
//              (float) voltageL    : voltage to give to the left motor (Volt)
//              (float*) pwmR (out) : the pwm command for the right motor
//              (float*) pwmL (out) : the pwm command for the left motor
// RETURN      : none
// DESCRIPTION :
//              This function computes the pwm to give to each motor according 
//              to the voltage wanted.
//-----------------------------------------------------------------------------
void calculatePWM(float voltageR,
                  float voltageL,
                  float* pwmR,
                  float* pwmL);

//-----------------------------------------------------------------------------
// FUNCTION    : pwmFilter
// PARAMETERS  :
//              (float) pwm        : a calculated pwm
//              (float) upperBound : the maximum value of a normal pwm
// RETURN      :
//              (float) : a limited pwm
// DESCRIPTION :
//              The purpose here is to limit the pwm given to the NXT motor.
//-----------------------------------------------------------------------------
float pwmFilter(float pwm, float upperBound);

//-----------------------------------------------------------------------------
// FUNCTION    : getMotorDiff
// PARAMETERS  : none
// RETURN      :
//              (float) : a motor count in radians
// DESCRIPTION :
//              This function gets the difference of the motor counts of the two
//              wheels and converts it in radians.
//-----------------------------------------------------------------------------
float getMotorDiff();

//-----------------------------------------------------------------------------
// FUNCTION    : syncMotor
// PARAMETERS  :
//              (U32) portR      : NXT port linked to the right motor
//              (U32) portL      : NXT port linked to the left motor
//              (float*) pwmR    : the pwm command for the right motor
//              (float*) pwmL    : the pwm command for the left motor
// RETURN      : none
// DESCRIPTION :
//              Synchronise the two nxt motors. This function uses a 
//              coefficient defined in "nxt_config.h" (K_SYNC) to compute 
//              the pwm of each motor in order to have the same
//              velocity.
//-----------------------------------------------------------------------------
void syncMotor(U32 portR, U32 portL, float* pwmR, float* pwmL);

//-----------------------------------------------------------------------------
// FUNCTION    : disp
// PARAMETERS  :
//              (int)row   : row of the NXT LCD Screen, should be between 0 and 
//                           7
//              (char*)str : string to print
//              (int)val   : value to print right after the string
// RETURN      : none
// DESCRIPTION :
//              NXT LCD display function, this function displays an integer 
//              with his tag at the specified line.
//-----------------------------------------------------------------------------
void disp(int row, char *str, int val);


