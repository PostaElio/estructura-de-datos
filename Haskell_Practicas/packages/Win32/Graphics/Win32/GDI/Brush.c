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

static void hugsprim_GetStockObject_4(HugsStackPtr);
static void hugsprim_GetStockObject_4(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr res1;
    arg1 = hugs->getInt32();
    res1 = GetStockObject(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteObject
#endif

static void hugsprim_DeleteObject_3(HugsStackPtr);
static void hugsprim_DeleteObject_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DeleteObject(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreatePatternBrush
#endif

static void hugsprim_CreatePatternBrush_2(HugsStackPtr);
static void hugsprim_CreatePatternBrush_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CreatePatternBrush(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateHatchBrush
#endif

static void hugsprim_CreateHatchBrush_1(HugsStackPtr);
static void hugsprim_CreateHatchBrush_1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getWord32();
    res1 = CreateHatchBrush(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateSolidBrush
#endif

static void hugsprim_CreateSolidBrush_0(HugsStackPtr);
static void hugsprim_CreateSolidBrush_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr res1;
    arg1 = hugs->getWord32();
    res1 = CreateSolidBrush(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_GetStockBrush", 2, hugsprim_GetStockObject_4},
    {"c_DeleteBrush", 2, hugsprim_DeleteObject_3},
    {"c_CreatePatternBrush", 2, hugsprim_CreatePatternBrush_2},
    {"c_CreateHatchBrush", 3, hugsprim_CreateHatchBrush_1},
    {"c_CreateSolidBrush", 2, hugsprim_CreateSolidBrush_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGBrush
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

