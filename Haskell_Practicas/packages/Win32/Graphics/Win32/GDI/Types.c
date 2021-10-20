/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "HsGDI.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef prim_MenuItemFromPoint
#endif

static void hugsprim_prim_MenuItemFromPoint_9(HugsStackPtr);
static void hugsprim_prim_MenuItemFromPoint_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = prim_MenuItemFromPoint(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef prim_ChildWindowFromPointEx
#endif

static void hugsprim_prim_ChildWindowFromPointEx_8(HugsStackPtr);
static void hugsprim_prim_ChildWindowFromPointEx_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = prim_ChildWindowFromPointEx(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef prim_ChildWindowFromPoint
#endif

static void hugsprim_prim_ChildWindowFromPoint_7(HugsStackPtr);
static void hugsprim_prim_ChildWindowFromPoint_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = prim_ChildWindowFromPoint(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef mAKEROP4
#endif

static void hugsprim_mAKEROP4_6(HugsStackPtr);
static void hugsprim_mAKEROP4_6(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    res1 = mAKEROP4(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef pALETTEINDEX
#endif

static void hugsprim_pALETTEINDEX_5(HugsStackPtr);
static void hugsprim_pALETTEINDEX_5(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsWord32 res1;
    arg1 = hugs->getWord16();
    res1 = pALETTEINDEX(arg1);
    hugs->putWord32(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef pALETTERGB
#endif

static void hugsprim_pALETTERGB_4(HugsStackPtr);
static void hugsprim_pALETTERGB_4(HugsStackPtr hugs_root)
{
    HsWord8 arg1;
    HsWord8 arg2;
    HsWord8 arg3;
    HsWord32 res1;
    arg1 = hugs->getWord8();
    arg2 = hugs->getWord8();
    arg3 = hugs->getWord8();
    res1 = pALETTERGB(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getBValue
#endif

static void hugsprim_getBValue_3(HugsStackPtr);
static void hugsprim_getBValue_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = getBValue(arg1);
    hugs->putWord8(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getGValue
#endif

static void hugsprim_getGValue_2(HugsStackPtr);
static void hugsprim_getGValue_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = getGValue(arg1);
    hugs->putWord8(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getRValue
#endif

static void hugsprim_getRValue_1(HugsStackPtr);
static void hugsprim_getRValue_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = getRValue(arg1);
    hugs->putWord8(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef rgb
#endif

static void hugsprim_rgb_0(HugsStackPtr);
static void hugsprim_rgb_0(HugsStackPtr hugs_root)
{
    HsWord8 arg1;
    HsWord8 arg2;
    HsWord8 arg3;
    HsWord32 res1;
    arg1 = hugs->getWord8();
    arg2 = hugs->getWord8();
    arg3 = hugs->getWord8();
    res1 = rgb(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnId(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"prim_MenuItemFromPoint", 4, hugsprim_prim_MenuItemFromPoint_9},
    {"prim_ChildWindowFromPointEx", 4, hugsprim_prim_ChildWindowFromPointEx_8},
    {"prim_ChildWindowFromPoint", 3, hugsprim_prim_ChildWindowFromPoint_7},
    {"mAKEROP4", 2, hugsprim_mAKEROP4_6},
    {"pALETTEINDEX", 1, hugsprim_pALETTEINDEX_5},
    {"pALETTERGB", 3, hugsprim_pALETTERGB_4},
    {"getBValue", 1, hugsprim_getBValue_3},
    {"getGValue", 1, hugsprim_getGValue_2},
    {"getRValue", 1, hugsprim_getRValue_1},
    {"rgb", 3, hugsprim_rgb_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGTypes
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

