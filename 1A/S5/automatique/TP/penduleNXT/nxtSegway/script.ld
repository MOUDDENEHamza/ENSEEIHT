MEMORY
{
    header_ram : ORIGIN = 2M-16, LENGTH = 16
    vector_ram : ORIGIN = 2M, LENGTH = 64
    ram : ORIGIN = 2M + 64, LENGTH = 64K - 64
}

RAM_BASE = 2M;
RAM_SIZE = 64k;

SECTIONS
{
 .header : {
     KEEP(*nxt_binary_header.s.o (*.text *.text.*))
     . = ALIGN(16);
 } > header_ram

/* The vectors are at 0, but since this is overlapped with 
 * the ram area we need to reserve some space for the vector
 * table
 */
.vectors : {
    KEEP(*tpl_vector_table.s.o (*.vectbl *.text.*))
    . = ALIGN(16);
} > vector_ram

__vectors_ram_start__  = ADDR(.vectors);
__vectors_ram_end__    = (ADDR(.vectors) + SIZEOF(.vectors));
__vectors_load_start__ = LOADADDR(.vectors);
__vectors_load_end__ = (LOADADDR(.vectors) + SIZEOF(.vectors));

 .entry : {
     KEEP(*nxt_entry_point.s.o (*.text *.text.*))
     . = ALIGN(16);
 } > ram
  
/*
 * The initialisation code goes first, followed by the text.
 * For a ram build it goes into ram, for a rom build it goes into rom.
 */
/*.init : {
    KEEP(*ecrobot_init.s.o (*.text *.text.*))
    . = ALIGN(16);
} 
 > ram
 */
 
  /*
   * code and consts of the operating system (Trampoline).
   * this section is not accessible from an untrusted process
   */
  . = ALIGN(4);
  ostext : {
    *(.osCode)
    *(.appCommonCode)
  } > ram

  . = ALIGN(4);
  osconst : {
    *(.osConst)
  } > ram
  
  /*
   * vars of the operating system (Trampoline)
   */
  . = ALIGN(4);
  osvars : {
    *(.osVar)
    *(.stacks) /* TODO : is it the best place ? */
  } > ram

  /*
   * code and consts of the processes of the applications
   */
  apptext ALIGN(16) : { /* MPC5510 MPU requires 16 bytes alignment */
    __SEG_START_APP_CODE_CONST_RGN = .;
    *(.osApiConst)  /* API constants    */
    *(.osApiCode)   /* API functions    */
    /* Sections for code of tasks and ISR */
    *(.Task_affichageCode)

    *(.Task_penduleCode)

    *(.ISR_isr_button_leftCode)

    *(.ISR_isr_button_rightCode)

    *(.ISR_isr_button_startCode)

    *(.ISR_isr_button_stopCode)

} > ram
  
  appconst ALIGN(16) : {
/* Sections for application const */  

  } > ram
  
  procconst ALIGN(16) : {
/* Sections for const of tasks and ISR */
      *(.Task_affichage_SEC_CONST_32BIT)
      *(.Task_affichage_SEC_CALIB_32BIT)
      *(.Task_affichage_SEC_CARTO_32BIT)
      *(.Task_affichage_SEC_CONFIG_DATA_32BIT)
      *(.Task_affichage_SEC_CONST_16BIT)
      *(.Task_affichage_SEC_CALIB_16BIT)
      *(.Task_affichage_SEC_CARTO_16BIT)
      *(.Task_affichage_SEC_CONFIG_DATA_16BIT)
      *(.Task_affichage_SEC_CONST_8BIT)
      *(.Task_affichage_SEC_CALIB_8BIT)
      *(.Task_affichage_SEC_CARTO_8BIT)
      *(.Task_affichage_SEC_CONFIG_DATA_8BIT)
      *(.Task_affichage_SEC_CONST_BOOLEAN)
      *(.Task_affichage_SEC_CALIB_BOOLEAN)
      *(.Task_affichage_SEC_CARTO_BOOLEAN)
      *(.Task_affichage_SEC_CONFIG_DATA_BOOLEAN)
      *(.Task_affichage_SEC_CONST_UNSPECIFIED)
      *(.Task_affichage_SEC_CALIB_UNSPECIFIED)
      *(.Task_affichage_SEC_CARTO_UNSPECIFIED)
      *(.Task_affichage_SEC_CONFIG_DATA_UNSPECIFIED)
      *(.Task_pendule_SEC_CONST_32BIT)
      *(.Task_pendule_SEC_CALIB_32BIT)
      *(.Task_pendule_SEC_CARTO_32BIT)
      *(.Task_pendule_SEC_CONFIG_DATA_32BIT)
      *(.Task_pendule_SEC_CONST_16BIT)
      *(.Task_pendule_SEC_CALIB_16BIT)
      *(.Task_pendule_SEC_CARTO_16BIT)
      *(.Task_pendule_SEC_CONFIG_DATA_16BIT)
      *(.Task_pendule_SEC_CONST_8BIT)
      *(.Task_pendule_SEC_CALIB_8BIT)
      *(.Task_pendule_SEC_CARTO_8BIT)
      *(.Task_pendule_SEC_CONFIG_DATA_8BIT)
      *(.Task_pendule_SEC_CONST_BOOLEAN)
      *(.Task_pendule_SEC_CALIB_BOOLEAN)
      *(.Task_pendule_SEC_CARTO_BOOLEAN)
      *(.Task_pendule_SEC_CONFIG_DATA_BOOLEAN)
      *(.Task_pendule_SEC_CONST_UNSPECIFIED)
      *(.Task_pendule_SEC_CALIB_UNSPECIFIED)
      *(.Task_pendule_SEC_CARTO_UNSPECIFIED)
      *(.Task_pendule_SEC_CONFIG_DATA_UNSPECIFIED)
      *(.ISR_isr_button_left_SEC_CONST_32BIT)
      *(.ISR_isr_button_left_SEC_CALIB_32BIT)
      *(.ISR_isr_button_left_SEC_CARTO_32BIT)
      *(.ISR_isr_button_left_SEC_CONFIG_DATA_32BIT)
      *(.ISR_isr_button_left_SEC_CONST_16BIT)
      *(.ISR_isr_button_left_SEC_CALIB_16BIT)
      *(.ISR_isr_button_left_SEC_CARTO_16BIT)
      *(.ISR_isr_button_left_SEC_CONFIG_DATA_16BIT)
      *(.ISR_isr_button_left_SEC_CONST_8BIT)
      *(.ISR_isr_button_left_SEC_CALIB_8BIT)
      *(.ISR_isr_button_left_SEC_CARTO_8BIT)
      *(.ISR_isr_button_left_SEC_CONFIG_DATA_8BIT)
      *(.ISR_isr_button_left_SEC_CONST_BOOLEAN)
      *(.ISR_isr_button_left_SEC_CALIB_BOOLEAN)
      *(.ISR_isr_button_left_SEC_CARTO_BOOLEAN)
      *(.ISR_isr_button_left_SEC_CONFIG_DATA_BOOLEAN)
      *(.ISR_isr_button_left_SEC_CONST_UNSPECIFIED)
      *(.ISR_isr_button_left_SEC_CALIB_UNSPECIFIED)
      *(.ISR_isr_button_left_SEC_CARTO_UNSPECIFIED)
      *(.ISR_isr_button_left_SEC_CONFIG_DATA_UNSPECIFIED)
      *(.ISR_isr_button_right_SEC_CONST_32BIT)
      *(.ISR_isr_button_right_SEC_CALIB_32BIT)
      *(.ISR_isr_button_right_SEC_CARTO_32BIT)
      *(.ISR_isr_button_right_SEC_CONFIG_DATA_32BIT)
      *(.ISR_isr_button_right_SEC_CONST_16BIT)
      *(.ISR_isr_button_right_SEC_CALIB_16BIT)
      *(.ISR_isr_button_right_SEC_CARTO_16BIT)
      *(.ISR_isr_button_right_SEC_CONFIG_DATA_16BIT)
      *(.ISR_isr_button_right_SEC_CONST_8BIT)
      *(.ISR_isr_button_right_SEC_CALIB_8BIT)
      *(.ISR_isr_button_right_SEC_CARTO_8BIT)
      *(.ISR_isr_button_right_SEC_CONFIG_DATA_8BIT)
      *(.ISR_isr_button_right_SEC_CONST_BOOLEAN)
      *(.ISR_isr_button_right_SEC_CALIB_BOOLEAN)
      *(.ISR_isr_button_right_SEC_CARTO_BOOLEAN)
      *(.ISR_isr_button_right_SEC_CONFIG_DATA_BOOLEAN)
      *(.ISR_isr_button_right_SEC_CONST_UNSPECIFIED)
      *(.ISR_isr_button_right_SEC_CALIB_UNSPECIFIED)
      *(.ISR_isr_button_right_SEC_CARTO_UNSPECIFIED)
      *(.ISR_isr_button_right_SEC_CONFIG_DATA_UNSPECIFIED)
      *(.ISR_isr_button_start_SEC_CONST_32BIT)
      *(.ISR_isr_button_start_SEC_CALIB_32BIT)
      *(.ISR_isr_button_start_SEC_CARTO_32BIT)
      *(.ISR_isr_button_start_SEC_CONFIG_DATA_32BIT)
      *(.ISR_isr_button_start_SEC_CONST_16BIT)
      *(.ISR_isr_button_start_SEC_CALIB_16BIT)
      *(.ISR_isr_button_start_SEC_CARTO_16BIT)
      *(.ISR_isr_button_start_SEC_CONFIG_DATA_16BIT)
      *(.ISR_isr_button_start_SEC_CONST_8BIT)
      *(.ISR_isr_button_start_SEC_CALIB_8BIT)
      *(.ISR_isr_button_start_SEC_CARTO_8BIT)
      *(.ISR_isr_button_start_SEC_CONFIG_DATA_8BIT)
      *(.ISR_isr_button_start_SEC_CONST_BOOLEAN)
      *(.ISR_isr_button_start_SEC_CALIB_BOOLEAN)
      *(.ISR_isr_button_start_SEC_CARTO_BOOLEAN)
      *(.ISR_isr_button_start_SEC_CONFIG_DATA_BOOLEAN)
      *(.ISR_isr_button_start_SEC_CONST_UNSPECIFIED)
      *(.ISR_isr_button_start_SEC_CALIB_UNSPECIFIED)
      *(.ISR_isr_button_start_SEC_CARTO_UNSPECIFIED)
      *(.ISR_isr_button_start_SEC_CONFIG_DATA_UNSPECIFIED)
      *(.ISR_isr_button_stop_SEC_CONST_32BIT)
      *(.ISR_isr_button_stop_SEC_CALIB_32BIT)
      *(.ISR_isr_button_stop_SEC_CARTO_32BIT)
      *(.ISR_isr_button_stop_SEC_CONFIG_DATA_32BIT)
      *(.ISR_isr_button_stop_SEC_CONST_16BIT)
      *(.ISR_isr_button_stop_SEC_CALIB_16BIT)
      *(.ISR_isr_button_stop_SEC_CARTO_16BIT)
      *(.ISR_isr_button_stop_SEC_CONFIG_DATA_16BIT)
      *(.ISR_isr_button_stop_SEC_CONST_8BIT)
      *(.ISR_isr_button_stop_SEC_CALIB_8BIT)
      *(.ISR_isr_button_stop_SEC_CARTO_8BIT)
      *(.ISR_isr_button_stop_SEC_CONFIG_DATA_8BIT)
      *(.ISR_isr_button_stop_SEC_CONST_BOOLEAN)
      *(.ISR_isr_button_stop_SEC_CALIB_BOOLEAN)
      *(.ISR_isr_button_stop_SEC_CARTO_BOOLEAN)
      *(.ISR_isr_button_stop_SEC_CONFIG_DATA_BOOLEAN)
      *(.ISR_isr_button_stop_SEC_CONST_UNSPECIFIED)
      *(.ISR_isr_button_stop_SEC_CALIB_UNSPECIFIED)
      *(.ISR_isr_button_stop_SEC_CARTO_UNSPECIFIED)
      *(.ISR_isr_button_stop_SEC_CONFIG_DATA_UNSPECIFIED)
    
    . = ALIGN(16);
    __SEG_STOP_APP_CODE_CONST_RGN = . - 1;
  } > ram

  /*
   * private data of processes
   */
  procvars : {
    __SEG_START_Task_affichage_VAR_RGN = .;
/* Initialized variables section of Task affichage */
    *(.Task_affichage_SEC_VAR_NOINIT_32BIT)
    *(.Task_affichage_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.Task_affichage_SEC_VAR_FAST_32BIT)
    *(.Task_affichage_SEC_VAR_32BIT)
    *(.Task_affichage_SEC_VAR_NOINIT_16BIT)
    *(.Task_affichage_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.Task_affichage_SEC_VAR_FAST_16BIT)
    *(.Task_affichage_SEC_VAR_16BIT)
    *(.Task_affichage_SEC_VAR_NOINIT_8BIT)
    *(.Task_affichage_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.Task_affichage_SEC_VAR_FAST_8BIT)
    *(.Task_affichage_SEC_VAR_8BIT)
    *(.Task_affichage_SEC_VAR_NOINIT_BOOLEAN)
    *(.Task_affichage_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.Task_affichage_SEC_VAR_FAST_BOOLEAN)
    *(.Task_affichage_SEC_VAR_BOOLEAN)
    *(.Task_affichage_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.Task_affichage_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.Task_affichage_SEC_VAR_FAST_UNSPECIFIED)
    *(.Task_affichage_SEC_VAR_UNSPECIFIED)
    __SEG_END_Task_affichage_VAR_RGN = ALIGN(16) - 1;
    __SEG_START_Task_pendule_VAR_RGN = .;
/* Initialized variables section of Task pendule */
    *(.Task_pendule_SEC_VAR_NOINIT_32BIT)
    *(.Task_pendule_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.Task_pendule_SEC_VAR_FAST_32BIT)
    *(.Task_pendule_SEC_VAR_32BIT)
    *(.Task_pendule_SEC_VAR_NOINIT_16BIT)
    *(.Task_pendule_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.Task_pendule_SEC_VAR_FAST_16BIT)
    *(.Task_pendule_SEC_VAR_16BIT)
    *(.Task_pendule_SEC_VAR_NOINIT_8BIT)
    *(.Task_pendule_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.Task_pendule_SEC_VAR_FAST_8BIT)
    *(.Task_pendule_SEC_VAR_8BIT)
    *(.Task_pendule_SEC_VAR_NOINIT_BOOLEAN)
    *(.Task_pendule_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.Task_pendule_SEC_VAR_FAST_BOOLEAN)
    *(.Task_pendule_SEC_VAR_BOOLEAN)
    *(.Task_pendule_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.Task_pendule_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.Task_pendule_SEC_VAR_FAST_UNSPECIFIED)
    *(.Task_pendule_SEC_VAR_UNSPECIFIED)
    __SEG_END_Task_pendule_VAR_RGN = ALIGN(16) - 1;
    __SEG_START_ISR_isr_button_left_VAR_RGN = .;
/* Initialized variables section of ISR isr_button_left */
    *(.ISR_isr_button_left_SEC_VAR_NOINIT_32BIT)
    *(.ISR_isr_button_left_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.ISR_isr_button_left_SEC_VAR_FAST_32BIT)
    *(.ISR_isr_button_left_SEC_VAR_32BIT)
    *(.ISR_isr_button_left_SEC_VAR_NOINIT_16BIT)
    *(.ISR_isr_button_left_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.ISR_isr_button_left_SEC_VAR_FAST_16BIT)
    *(.ISR_isr_button_left_SEC_VAR_16BIT)
    *(.ISR_isr_button_left_SEC_VAR_NOINIT_8BIT)
    *(.ISR_isr_button_left_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.ISR_isr_button_left_SEC_VAR_FAST_8BIT)
    *(.ISR_isr_button_left_SEC_VAR_8BIT)
    *(.ISR_isr_button_left_SEC_VAR_NOINIT_BOOLEAN)
    *(.ISR_isr_button_left_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.ISR_isr_button_left_SEC_VAR_FAST_BOOLEAN)
    *(.ISR_isr_button_left_SEC_VAR_BOOLEAN)
    *(.ISR_isr_button_left_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.ISR_isr_button_left_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.ISR_isr_button_left_SEC_VAR_FAST_UNSPECIFIED)
    *(.ISR_isr_button_left_SEC_VAR_UNSPECIFIED)
    __SEG_END_ISR_isr_button_left_VAR_RGN = ALIGN(16) - 1;
    __SEG_START_ISR_isr_button_right_VAR_RGN = .;
/* Initialized variables section of ISR isr_button_right */
    *(.ISR_isr_button_right_SEC_VAR_NOINIT_32BIT)
    *(.ISR_isr_button_right_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.ISR_isr_button_right_SEC_VAR_FAST_32BIT)
    *(.ISR_isr_button_right_SEC_VAR_32BIT)
    *(.ISR_isr_button_right_SEC_VAR_NOINIT_16BIT)
    *(.ISR_isr_button_right_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.ISR_isr_button_right_SEC_VAR_FAST_16BIT)
    *(.ISR_isr_button_right_SEC_VAR_16BIT)
    *(.ISR_isr_button_right_SEC_VAR_NOINIT_8BIT)
    *(.ISR_isr_button_right_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.ISR_isr_button_right_SEC_VAR_FAST_8BIT)
    *(.ISR_isr_button_right_SEC_VAR_8BIT)
    *(.ISR_isr_button_right_SEC_VAR_NOINIT_BOOLEAN)
    *(.ISR_isr_button_right_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.ISR_isr_button_right_SEC_VAR_FAST_BOOLEAN)
    *(.ISR_isr_button_right_SEC_VAR_BOOLEAN)
    *(.ISR_isr_button_right_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.ISR_isr_button_right_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.ISR_isr_button_right_SEC_VAR_FAST_UNSPECIFIED)
    *(.ISR_isr_button_right_SEC_VAR_UNSPECIFIED)
    __SEG_END_ISR_isr_button_right_VAR_RGN = ALIGN(16) - 1;
    __SEG_START_ISR_isr_button_start_VAR_RGN = .;
/* Initialized variables section of ISR isr_button_start */
    *(.ISR_isr_button_start_SEC_VAR_NOINIT_32BIT)
    *(.ISR_isr_button_start_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.ISR_isr_button_start_SEC_VAR_FAST_32BIT)
    *(.ISR_isr_button_start_SEC_VAR_32BIT)
    *(.ISR_isr_button_start_SEC_VAR_NOINIT_16BIT)
    *(.ISR_isr_button_start_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.ISR_isr_button_start_SEC_VAR_FAST_16BIT)
    *(.ISR_isr_button_start_SEC_VAR_16BIT)
    *(.ISR_isr_button_start_SEC_VAR_NOINIT_8BIT)
    *(.ISR_isr_button_start_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.ISR_isr_button_start_SEC_VAR_FAST_8BIT)
    *(.ISR_isr_button_start_SEC_VAR_8BIT)
    *(.ISR_isr_button_start_SEC_VAR_NOINIT_BOOLEAN)
    *(.ISR_isr_button_start_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.ISR_isr_button_start_SEC_VAR_FAST_BOOLEAN)
    *(.ISR_isr_button_start_SEC_VAR_BOOLEAN)
    *(.ISR_isr_button_start_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.ISR_isr_button_start_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.ISR_isr_button_start_SEC_VAR_FAST_UNSPECIFIED)
    *(.ISR_isr_button_start_SEC_VAR_UNSPECIFIED)
    __SEG_END_ISR_isr_button_start_VAR_RGN = ALIGN(16) - 1;
    __SEG_START_ISR_isr_button_stop_VAR_RGN = .;
/* Initialized variables section of ISR isr_button_stop */
    *(.ISR_isr_button_stop_SEC_VAR_NOINIT_32BIT)
    *(.ISR_isr_button_stop_SEC_VAR_POWER_ON_INIT_32BIT)
    *(.ISR_isr_button_stop_SEC_VAR_FAST_32BIT)
    *(.ISR_isr_button_stop_SEC_VAR_32BIT)
    *(.ISR_isr_button_stop_SEC_VAR_NOINIT_16BIT)
    *(.ISR_isr_button_stop_SEC_VAR_POWER_ON_INIT_16BIT)
    *(.ISR_isr_button_stop_SEC_VAR_FAST_16BIT)
    *(.ISR_isr_button_stop_SEC_VAR_16BIT)
    *(.ISR_isr_button_stop_SEC_VAR_NOINIT_8BIT)
    *(.ISR_isr_button_stop_SEC_VAR_POWER_ON_INIT_8BIT)
    *(.ISR_isr_button_stop_SEC_VAR_FAST_8BIT)
    *(.ISR_isr_button_stop_SEC_VAR_8BIT)
    *(.ISR_isr_button_stop_SEC_VAR_NOINIT_BOOLEAN)
    *(.ISR_isr_button_stop_SEC_VAR_POWER_ON_INIT_BOOLEAN)
    *(.ISR_isr_button_stop_SEC_VAR_FAST_BOOLEAN)
    *(.ISR_isr_button_stop_SEC_VAR_BOOLEAN)
    *(.ISR_isr_button_stop_SEC_VAR_NOINIT_UNSPECIFIED)
    *(.ISR_isr_button_stop_SEC_VAR_POWER_ON_INIT_UNSPECIFIED)
    *(.ISR_isr_button_stop_SEC_VAR_FAST_UNSPECIFIED)
    *(.ISR_isr_button_stop_SEC_VAR_UNSPECIFIED)
    __SEG_END_ISR_isr_button_stop_VAR_RGN = ALIGN(16) - 1;
  } > ram

  /*
   * stack of processes
   */
  procstack : {

  /* Section of stack of Task affichage  */
    __SEG_START_Task_affichage_STACK_RGN = .;
    *(.Task_affichageStack)
    __SEG_END_Task_affichage_STACK_RGN = ALIGN(16) - 1;

  /* Section of stack of Task pendule  */
    __SEG_START_Task_pendule_STACK_RGN = .;
    *(.Task_penduleStack)
    __SEG_END_Task_pendule_STACK_RGN = ALIGN(16) - 1;

  /* Section of stack of ISR isr_button_left  */
    __SEG_START_ISR_isr_button_left_STACK_RGN = .;
    *(.ISR_isr_button_leftStack)
    __SEG_END_ISR_isr_button_left_STACK_RGN = ALIGN(16) - 1;

  /* Section of stack of ISR isr_button_right  */
    __SEG_START_ISR_isr_button_right_STACK_RGN = .;
    *(.ISR_isr_button_rightStack)
    __SEG_END_ISR_isr_button_right_STACK_RGN = ALIGN(16) - 1;

  /* Section of stack of ISR isr_button_start  */
    __SEG_START_ISR_isr_button_start_STACK_RGN = .;
    *(.ISR_isr_button_startStack)
    __SEG_END_ISR_isr_button_start_STACK_RGN = ALIGN(16) - 1;

  /* Section of stack of ISR isr_button_stop  */
    __SEG_START_ISR_isr_button_stop_STACK_RGN = .;
    *(.ISR_isr_button_stopStack)
    __SEG_END_ISR_isr_button_stop_STACK_RGN = ALIGN(16) - 1;

 } > ram


  /*
   * os application data
   */
  appvars : {
 
  } > ram

  /*
   * remaining .text (ie no section given)
   */
  . = ALIGN(4);
  text_garbage : {
    *(.text*)
    . = ALIGN(16);
  } > ram

__ramtext_ram_start__ = ADDR(ostext);
__ramtext_ram_end__   = ADDR(text_garbage) + SIZEOF(text_garbage);
__ramtext_load_start__ = LOADADDR(ostext); 
__ramtext_load_end__ = __ramtext_load_start__ + SIZEOF(ostext) + SIZEOF(osconst) + SIZEOF(osvars) + SIZEOF(apptext) + SIZEOF(appconst) + SIZEOF(procconst) + SIZEOF(procvars) + SIZEOF(procstack) + SIZEOF(appvars) + SIZEOF(text_garbage) ;


  .data : {
    * (*.data *.data.*)
    *(.rodata)      /* litteral strings */
    *(.rodata*)
    . = ALIGN(16);
  } > ram 
 
  /*
   * bss data
   */
  .bss ALIGN(16) : {
    *(.bss)
    *(.bss*)
  } > ram
  . = ALIGN(16);
  
  /*
   * garbage
   */
  garbage : {
    *(COMMON)
  } > ram
  
  /* LOADADDR is the same as the ADDR if it is a ram build */
__data_ram_start__ = ADDR(.data);
__data_ram_end__   = ADDR(garbage) + SIZEOF(garbage);
__data_load_start__ = LOADADDR(.data); 
__data_load_end__ = __data_load_start__ + SIZEOF(.data) + SIZEOF(.bss) + SIZEOF(garbage) ;

  .comment : {
    *(.glue_7*)
    *(.comment) 
  } > ram
      
/*  debug : {
    *(.debug);
    . = ALIGN(4);
    *(.debug_srcinfo);
    . = ALIGN(4);
    *(.debug_sfnames);
    . = ALIGN(4);
    *(.debug_aranges*);
    . = ALIGN(4);
    *(.debug_pubnames*);
    . = ALIGN(4);
    *(.debug_info*);
    . = ALIGN(4);
    *(.debug_abbrev*);
    . = ALIGN(4);
    *(.debug_line*);
    . = ALIGN(4);
    *(.debug_frame*);
    . = ALIGN(4);
    *(.debug_str*);
    . = ALIGN(4);
    *(.debug_loc*);
    . = ALIGN(4);
    *(.debug_macinfo);
    . = ALIGN(4);
    *(.debug_weaknames);
    . = ALIGN(4);
    *(.debug_funcnames);
    . = ALIGN(4);
    *(.debug_typenames);
    . = ALIGN(4);
    *(.debug_varnames);
    . = ALIGN(4);  
  } > ram*/
  
}

