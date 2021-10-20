/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef GetStockObject
#endif

static void hugsprim_GetStockObject_2(HugsStackPtr);
static void hugsprim_GetStockObject_2(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsPtr res1;
    arg1 = hugs->getWord16();
    res1 = GetStockObject(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteObject
#endif

static void hugsprim_DeleteObject_1(HugsStackPtr);
static void hugsprim_DeleteObject_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    DeleteObject(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateFontW
#endif

static void hugsprim_CreateFontW_0(HugsStackPtr);
static void hugsprim_CreateFontW_0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsWord32 arg5;
    HsBool arg6;
    HsBool arg7;
    HsBool arg8;
    HsWord32 arg9;
    HsWord32 arg10;
    HsWord32 arg11;
    HsWord32 arg12;
    HsWord32 arg13;
    HsPtr arg14;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getWord32();
    arg6 = hugs->getBool();
    arg7 = hugs->getBool();
    arg8 = hugs->getBool();
    arg9 = hugs->getWord32();
    arg10 = hugs->getWord32();
    arg11 = hugs->getWord32();
    arg12 = hugs->getWord32();
    arg13 = hugs->getWord32();
    arg14 = hugs->getPtr();
    res1 = CreateFontW(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"getStockFont", 2, hugsprim_GetStockObject_2},
    {"deleteFont", 2, hugsprim_DeleteObject_1},
    {"c_CreateFont", 15, hugsprim_CreateFontW_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGFont
#endif

static struct hugs_primInfo hugs_prims = { hugs_primControl, hugs_primTable, 0 };

#ifdef __cplusplus
extern "C" {
#endif
#ifndef __cplusplus
DLLEXPORT(int)  HugsAPIVersion(void);
#endif
DLLEXPORT(int)  HugsAPIVersion() {return (5);}
DLLEXPORT(void) initModule(HugsAPI5 *);
DLLEXPORT(void) initModule(HugsAPI5 *hugsAPI) {
    hugs = hugsAPI;
    hugs->registerPrims(&hugs_prims);
}
#ifdef __cplusplus
}
#endif

