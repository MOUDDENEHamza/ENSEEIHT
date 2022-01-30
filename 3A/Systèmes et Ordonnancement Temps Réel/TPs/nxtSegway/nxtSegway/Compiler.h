/**
 * @file Compiler.h
 *
 * @section desc File description
 *
 * Compiler abstraction for all AUTOSAR Modules
 *
 * @section copyright Copyright
 *
 * Trampoline OS
 *
 * Trampoline is copyright (c) IRCCyN 2005-2007
 * Trampoline is protected by the French intellectual property law.
 *
 * This software is distributed under the Lesser GNU Public Licence
 *
 * @section infos File informations
 *
 * $Date$
 * $Rev$
 * $Author$
 * $URL$
 */
 
#ifndef COMPILER_H
#define COMPILER_H

/******************************************************************************/
/* INCLUSIONS                                                                 */
/******************************************************************************/
#include "Compiler_Cfg.h"


/******************************************************************************/
/* DEFINITION OF MACROS                                                       */
/******************************************************************************/
#define _GCC_C_ARMADEUS_APF27_
#define AUTOMATIC
#define TYPEDEF
#define STATIC static
#define NULL_PTR ((void *)0)
#define INLINE (#pragma INLINE)

#define CURRENT_LINKER_CODE_SECTION_NAME
#define CURRENT_LINKER_DATA_SECTION_NAME

#define FUNC(rettype, memclass) \
          rettype memclass \
     CURRENT_LINKER_CODE_SECTION_NAME

#define P2VAR(ptrtype, memclass, ptrclass) \
     ptrtype memclass * ptrclass \
          CURRENT_LINKER_DATA_SECTION_NAME
   
#define P2CONST(ptrtype, memclass, ptrclass) \
     const ptrtype memclass * ptrclass \
          CURRENT_LINKER_DATA_SECTION_NAME
     
#define CONSTP2VAR(ptrtype, memclass, ptrclass) \
          ptrtype memclass * const ptrclass \
          CURRENT_LINKER_DATA_SECTION_NAME

#define CONSTP2CONST(ptrtype, memclass, ptrclass) \
          const ptrtype memclass * const ptrclass \
          CURRENT_LINKER_DATA_SECTION_NAME
                  
#define P2FUNC(rettype, ptrclass, fctname) \
     rettype (*ptrclass fctname) \
          CURRENT_LINKER_DATA_SECTION_NAME

#define CONST(consttype, memclass) \
     const consttype memclass \
          CURRENT_LINKER_DATA_SECTION_NAME

#define VAR(vartype, memclass) \
     vartype memclass \
          CURRENT_LINKER_DATA_SECTION_NAME

/*****************************************************************************/
/* PUBLISHED INFORMATION                                                     */
/*****************************************************************************/
#define COMPILER_VENDOR_ID        48
#define COMPILER_AR_MAJOR_VERSION 3
#define COMPILER_AR_MINOR_VERSION 0
#define COMPILER_AR_PATCH_VERSION 0
#define COMPILER_SW_MAJOR_VERSION 1
#define COMPILER_SW_MINOR_VERSION 1
#define COMPILER_SW_PATCH_VERSION 0


#endif /* COMPILER_H */

