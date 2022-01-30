#!/usr/bin/perl 
# File            : nxtlus
# Author          : based on legolus by christophe Mauras
# Created On      : march 4, 2008
# needs           : lustre, poc

$name = shift(@ARGV);
$node = shift(@ARGV);
if ($name) {
	if (!-e "${name}.lus")
	    {print "Sorry, ${name}.lus not found\n"; exit 1 ;}
        system "lustre ${name}.lus ${node} -0 -o ${name}.oc";
        system "poc ${name}.oc -o ${name}.c";
        system "rm ${name}.oc";
	open (IN, "${name}.h") ||
		print "cannot open ${name}.h for reading \n" ;
	if (!open (OUT, ">${name}_${node}.c"))
    	    { close IN ; print "cannot open ${name}_${node}.c for writing \n" ; }
        print OUT <<Preamble;
#include "tpl_os.h"
#include "nxt_motors.h"
#include "ecrobot_interface.h"
#include "ecrobot_private.h"	

FUNC(int, OS_APPL_CODE) main(void)
{   
    StartOS(OSDEFAULTAPPMODE);
    return 0;
}

DeclareTask(Task1);


Preamble
	$LineNumber = 0; $copier = 0;
	while (($in_line=<IN>)) {
		++$LineNumber;	
		if ($in_line =~ /^#endif/) {$copier = 0;};
		if ($in_line =~ /^typedef/) {$copier = 1;};
                if ($copier == 1) {  print OUT "$in_line";};
                if ($in_line =~ /^}/) {$copier = 0;}
        }
        close IN;
	open (IN, "${name}.c")||
		print "cannot open ${name}.h for reading \n" ;
	$LineNumber = 0; $copier = 0;
	while (($in_line=<IN>)) {
		++$LineNumber;		
		if ($in_line =~ /^\w*\s*void\s*\w+_reset/) {$copier = 1;}
                if ($copier == 1) {print OUT "$in_line"; }
                if ($in_line =~ /^}/) {$copier = 0; }
        }
	close IN;
print OUT <<Output;

static ${node}_ctx the_ctx;

_integer speedA, speedB, speedC;

void ${node}_O_Avant_A(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_A, speedA);}
void ${node}_O_Avant_B(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_B, speedB);}
void ${node}_O_Avant_C(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_C, speedC);}

void ${node}_O_Arriere_A(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_A, -speedA);}
void ${node}_O_Arriere_B(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_B, -speedB);}
void ${node}_O_Arriere_C(void* cdata, _boolean v)
      {if (v) ecrobot_set_motor_speed(NXT_PORT_C, -speedC);}

void ${node}_O_Vitesse_A(void* cdata, _integer v)
      {speedA = v;}
void ${node}_O_Vitesse_B(void* cdata, _integer v)
      {speedB = v;}
void ${node}_O_Vitesse_C(void* cdata, _integer v)
      {speedC = v;}

Output
        open (IN, "${name}.c");
	$LineNumber = 0; $copier = 0;
	while (($in_line=<IN>)) {
		++$LineNumber;		
		if ($in_line =~ /^.*_I_.*/) {$copier = 1; }
                if ($copier == 1) {  print OUT "$in_line"; }
                if ($in_line =~ /^}/) {$copier = 0;}
        }
	close IN;
        open (IN, "${name}.c");
	$LineNumber = 0; $copier = 0;
	while (($in_line=<IN>)) {
		++$LineNumber;		
		if ($in_line =~ /^\w*\s*void\s*\w+_step/) {$copier = 1;}
                if ($copier == 1){  print OUT "$in_line";};
        }
	close IN;
        print OUT <<TheMain;
TASK(TaskInitialize){
    ${node}_reset(&the_ctx);

    TerminateTask();
}


TASK(Task1){

    if (ecrobot_get_touch_sensor(NXT_PORT_S1)==1)
        {${node}_I_capteur_1(&the_ctx, _true);}
    else
        {${node}_I_capteur_1(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S2)==1)
       {${node}_I_capteur_2(&the_ctx, _true);}
    else
       {${node}_I_capteur_2(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S3)==1)
       {${node}_I_capteur_3(&the_ctx, _true);}
    else
       {${node}_I_capteur_3(&the_ctx, _false);}

    if (ecrobot_get_touch_sensor(NXT_PORT_S4)==1)
       {${node}_I_capteur_4(&the_ctx, _true);}
    else
       {${node}_I_capteur_4(&the_ctx, _false);}

    ${node}_step(&the_ctx);
    TerminateTask();
}

ISR(isr_button_start)
{
    ecrobot_status_monitor("isr_button_start");
    
}

ISR(isr_button_stop)
{
    ShutdownOS(E_OK);
}

ISR(isr_button_left)
{
    ecrobot_status_monitor("isr_button_left"); 

}

ISR(isr_button_right)
{
    ecrobot_status_monitor("isr_button_right");   

}

TheMain
        close OUT;
        system "rm ${name}.c ${name}.h";
        system "rm -f ${node}.ec";
        print "C code in : ${name}_${node}.c \n";

}

if (!${name}) {
    print STDERR <<EndOfUsage;
Usage: $0 file nodename
file.lus must contain node:
node nodename (
                capteur_1: bool; -- capteur toucher sur NXT_PORT_1
                capteur_2: bool; -- capteur toucher sur NXT_PORT_2
                capteur_3: bool; -- capteur toucher sur NXT_PORT_3
		capteur_4: bool; -- capteur toucher sur NXT_PORT_4
 )
returns (
Avant_A, Arriere_A :bool ;     -- Autorisations aller avant arriere moteur A
Vitesse_A : int;               -- Vitesse moteur A (0 à 100)
Avant_B, Arriere_B :bool ;     -- Autorisations aller avant arriere moteur B
Vitesse_B : int;               -- Vitesse moteur B (0 à 100)
Avant_C, Arriere_C :bool ;     -- Autorisations aller avant arriere moteur C
Vitesse_C : int;               -- Vitesse moteur C (0 à 100)
);

EndOfUsage
exit 1;
}

exit 0;



