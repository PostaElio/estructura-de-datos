/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef RectInRegion
#endif

static void hugsprim_RectInRegion_15(HugsStackPtr);
static void hugsprim_RectInRegion_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = RectInRegion(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PtInRegion
#endif

static void hugsprim_PtInRegion_14(HugsStackPtr);
static void hugsprim_PtInRegion_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    res1 = PtInRegion(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FrameRgn
#endif

static void hugsprim_FrameRgn_13(HugsStackPtr);
static void hugsprim_FrameRgn_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt arg4;
    HsInt arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    res1 = FrameRgn(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PaintRgn
#endif

static void hugsprim_PaintRgn_12(HugsStackPtr);
static void hugsprim_PaintRgn_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = PaintRgn(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef InvertRgn
#endif

static void hugsprim_InvertRgn_11(HugsStackPtr);
static void hugsprim_InvertRgn_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = InvertRgn(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FillRgn
#endif

static void hugsprim_FillRgn_10(HugsStackPtr);
static void hugsprim_FillRgn_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = FillRgn(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EqualRgn
#endif

static void hugsprim_EqualRgn_9(HugsStackPtr);
static void hugsprim_EqualRgn_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = EqualRgn(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreatePolygonRgn
#endif

static void hugsprim_CreatePolygonRgn_8(HugsStackPtr);
static void hugsprim_CreatePolygonRgn_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt32();
    res1 = CreatePolygonRgn(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateRoundRectRgn
#endif

static void hugsprim_CreateRoundRectRgn_7(HugsStackPtr);
static void hugsprim_CreateRoundRectRgn_7(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    res1 = CreateRoundRectRgn(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateRectRgnIndirect
#endif

static void hugsprim_CreateRectRgnIndirect_6(HugsStackPtr);
static void hugsprim_CreateRectRgnIndirect_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CreateRectRgnIndirect(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateRectRgn
#endif

static void hugsprim_CreateRectRgn_5(HugsStackPtr);
static void hugsprim_CreateRectRgn_5(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    res1 = CreateRectRgn(arg1, arg2, arg3, arg4);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateEllipticRgnIndirect
#endif

static void hugsprim_CreateEllipticRgnIndirect_4(HugsStackPtr);
static void hugsprim_CreateEllipticRgnIndirect_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CreateEllipticRgnIndirect(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateEllipticRgn
#endif

static void hugsprim_CreateEllipticRgn_3(HugsStackPtr);
static void hugsprim_CreateEllipticRgn_3(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    res1 = CreateEllipticRgn(arg1, arg2, arg3, arg4);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetRgnBox
#endif

static void hugsprim_GetRgnBox_2(HugsStackPtr);
static void hugsprim_GetRgnBox_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetRgnBox(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef OffsetRgn
#endif

static void hugsprim_OffsetRgn_1(HugsStackPtr);
static void hugsprim_OffsetRgn_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = OffsetRgn(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CombineRgn
#endif

static void hugsprim_CombineRgn_0(HugsStackPtr);
static void hugsprim_CombineRgn_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    res1 = CombineRgn(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_RectInRegion", 3, hugsprim_RectInRegion_15},
    {"c_PtInRegion", 4, hugsprim_PtInRegion_14},
    {"c_FrameRgn", 6, hugsprim_FrameRgn_13},
    {"c_PaintRgn", 3, hugsprim_PaintRgn_12},
    {"c_InvertRgn", 3, hugsprim_InvertRgn_11},
    {"c_FillRgn", 4, hugsprim_FillRgn_10},
    {"equalRgn", 3, hugsprim_EqualRgn_9},
    {"c_CreatePolygonRgn", 4, hugsprim_CreatePolygonRgn_8},
    {"c_CreateRoundRectRgn", 7, hugsprim_CreateRoundRectRgn_7},
    {"c_CreateRectRgnIndirect", 2, hugsprim_CreateRectRgnIndirect_6},
    {"c_CreateRectRgn", 5, hugsprim_CreateRectRgn_5},
    {"c_CreateEllipticRgnIndirect", 2, hugsprim_CreateEllipticRgnIndirect_4},
    {"c_CreateEllipticRgn", 5, hugsprim_CreateEllipticRgn_3},
    {"c_GetRgnBox", 3, hugsprim_GetRgnBox_2},
    {"c_OffsetRgn", 4, hugsprim_OffsetRgn_1},
    {"c_CombineRgn", 5, hugsprim_CombineRgn_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGRegion
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

