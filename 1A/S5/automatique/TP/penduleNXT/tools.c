#include "tools.h"
#include "math.h"
#include "nxt_config.h"

/* Time variable */    
int previous_time= 0;

//-----------------------------------------------------------------------------
// FUNCTION    : init_time
// PARAMETERS  : (int) initial_time 
// RETURN      : none
// DESCRIPTION :
//               Initialize the time
//-----------------------------------------------------------------------------
void init_time(int initial_time) {
  previous_time= initial_time;
}
 
//-----------------------------------------------------------------------------
// FUNCTION    : delta_t
// PARAMETERS  : none
// RETURN      :
//               (float) : the sample time
// DESCRIPTION :
//               This function computes the sample time 
//-----------------------------------------------------------------------------
float delta_t() {
  /* get sample time */
  int time= 0;
  float dt= 0.;

  time            = ecrobot_get_systick_ms();
  dt              = ((float) (time-previous_time))/1000;
  previous_time   = time;

  return dt;
}

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
float getGyro(int gyro_offset) {
        int gyro = (int)ecrobot_get_gyro_sensor(PORT_GYRO); 
	                       /* gyro value (deg/s) */
        gyro = gyro - gyro_offset; /* substract the offset */
        float fgyro = (float)gyro;
        fgyro = fgyro*DEG2RAD; 
	/* conversion in radians, DEG2RAD defined in "nxt_config.h" */
        return fgyro;
}

//-----------------------------------------------------------------------------
// FUNCTION    : getMotorAngle
// PARAMETERS  : none
// RETURN      :
//              (float) : a motor count in radians
// DESCRIPTION :
//              This function gets the mean of the motor counts of the two wheel
//              and converts it in radians.
//-----------------------------------------------------------------------------
float getMotorAngle() {
        float motorCountR = (float)nxt_motor_get_count(PORT_MOTOR_R); 
                                              /* motor count in degrees */
        float motorCountL = (float)nxt_motor_get_count(PORT_MOTOR_L);
        float motorCount = (motorCountR + motorCountL)*0.5; /*mean*/
        motorCount = motorCount*DEG2RAD; 
                  /* conversion in radians, DEG2RAD defined in "nxt_config.h" */
        return motorCount;
}

//-----------------------------------------------------------------------------
// FUNCTION    : nxt_motors_set_control
// PARAMETERS  : (float) u : command
// RETURN      : none
// DESCRIPTION :
//              This function provides the command to the nxt motors.
//-----------------------------------------------------------------------------
void nxt_motors_set_command(float u){

    float pwmR;     /* pwm to give to the Right wheel           */
    float pwmL;     /* pwm to give to the Left wheel            */

    /*calculate the PWMs*/
    calculatePWM(u, u, &pwmR, &pwmL);

    /*Synchonize motors*/
    syncMotor(PORT_MOTOR_R, PORT_MOTOR_L, &pwmR, &pwmL);

    /*apply the command */
    nxt_motor_set_speed(NXT_PORT_B, (int) pwmFilter(pwmR, PWMMAX), 1);
    nxt_motor_set_speed(NXT_PORT_C, (int) pwmFilter(pwmL, PWMMAX), 1);

}

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
                  float* pwmL) {
        float Vmax;
        float Vbatt;
        U16 battery_voltage = ecrobot_get_battery_voltage(); 
	                                    /* battery voltage (mV) */
        Vbatt = ((float)battery_voltage)/1000.0; /*conversion*/
        Vmax = Vbatt*V_COEFF - V_OFFSET; /* convert into motor Voltage*/
        *pwmR = (voltageR/Vmax)*100;  /* a pwm is a percentage */
        *pwmL = (voltageL/Vmax)*100;
}

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
float pwmFilter(float pwm, float upperBound) {
        float result;
        if (pwm > upperBound) {
                result = upperBound;
        } else if (pwm < (-upperBound)) {
                result = -upperBound;
        } else {
                result = pwm;
        }
        return result;
}

//-----------------------------------------------------------------------------
// FUNCTION    : getMotorDiff
// PARAMETERS  : none
// RETURN      :
//              (float) : a motor count in radians
// DESCRIPTION :
//              This function gets the difference of the motor counts of the two
//              wheels and converts it in radians.
//-----------------------------------------------------------------------------
float getMotorDiff() {
        float motorCountR = (float)nxt_motor_get_count(PORT_MOTOR_R); 
                                               /* motor count in degrees */
        float motorCountL = (float)nxt_motor_get_count(PORT_MOTOR_L);
        float motorDiff = motorCountR - motorCountL; /* difference */
        motorDiff = motorDiff*DEG2RAD; 
               /* conversion in radians, DEG2RAD defined in "nxt_config.h" */
        return motorDiff;
}

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
void syncMotor(U32 portR, U32 portL, float* pwmR, float* pwmL) {
        float motorDiff = getMotorDiff(); 
	             /* motor count difference in radians */
        /* Increase the pwm given to the motor with the lowest count */
        if (motorDiff >=0) {
                *pwmL = K_SYNC * motorDiff + *pwmR;
        } else {
                *pwmR = K_SYNC * (-motorDiff) + *pwmL;
        }
}

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
void disp(int row, char *str, int val)
{
#define DISPLAY_ON
#ifdef DISPLAY_ON
        display_goto_xy(0, row); /* go to the specified line */
        display_string(str);
        display_int(val, 0);
        display_update(); /* refresh the NXT LCD screen */
#endif
}

