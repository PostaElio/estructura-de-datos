/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "Win32Aux.h"
#include "WndProc.h"
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDIBitmap
#endif

static void hugsprim_CreateDIBitmap_11(HugsStackPtr);
static void hugsprim_CreateDIBitmap_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsWord32 arg6;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    arg6 = hugs->getWord32();
    res1 = CreateDIBitmap(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetDIBits
#endif

static void hugsprim_SetDIBits_10(HugsStackPtr);
static void hugsprim_SetDIBits_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsWord32 arg7;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    arg7 = hugs->getWord32();
    res1 = SetDIBits(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDIBits
#endif

static void hugsprim_GetDIBits_9(HugsStackPtr);
static void hugsprim_GetDIBits_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsWord32 arg7;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    arg7 = hugs->getWord32();
    res1 = GetDIBits(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}
#include "dumpBMP.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateBMPFile
#endif

static void hugsprim_CreateBMPFile_8(HugsStackPtr);
static void hugsprim_CreateBMPFile_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    CreateBMPFile(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetObjectW
#endif

static void hugsprim_GetObjectW_7(HugsStackPtr);
static void hugsprim_GetObjectW_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    res1 = GetObjectW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetBitmapDimensionEx
#endif

static void hugsprim_SetBitmapDimensionEx_6(HugsStackPtr);
static void hugsprim_SetBitmapDimensionEx_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    res1 = SetBitmapDimensionEx(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetBitmapDimensionEx
#endif

static void hugsprim_GetBitmapDimensionEx_5(HugsStackPtr);
static void hugsprim_GetBitmapDimensionEx_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetBitmapDimensionEx(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDIBPatternBrushPt
#endif

static void hugsprim_CreateDIBPatternBrushPt_4(HugsStackPtr);
static void hugsprim_CreateDIBPatternBrushPt_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = CreateDIBPatternBrushPt(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateCompatibleBitmap
#endif

static void hugsprim_CreateCompatibleBitmap_3(HugsStackPtr);
static void hugsprim_CreateCompatibleBitmap_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = CreateCompatibleBitmap(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateBitmapIndirect
#endif

static void hugsprim_CreateBitmapIndirect_2(HugsStackPtr);
static void hugsprim_CreateBitmapIndirect_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CreateBitmapIndirect(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateBitmap
#endif

static void hugsprim_CreateBitmap_1(HugsStackPtr);
static void hugsprim_CreateBitmap_1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsPtr arg5;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getPtr();
    res1 = CreateBitmap(arg1, arg2, arg3, arg4, arg5);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteObject
#endif

static void hugsprim_DeleteObject_0(HugsStackPtr);
static void hugsprim_DeleteObject_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DeleteObject(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_CreateDIBitmap", 7, hugsprim_CreateDIBitmap_11},
    {"c_SetDIBits", 8, hugsprim_SetDIBits_10},
    {"c_GetDIBits", 8, hugsprim_GetDIBits_9},
    {"c_CreateBMPFile", 4, hugsprim_CreateBMPFile_8},
    {"c_GetBitmapInfo", 4, hugsprim_GetObjectW_7},
    {"c_SetBitmapDimensionEx", 5, hugsprim_SetBitmapDimensionEx_6},
    {"c_GetBitmapDimensionEx", 3, hugsprim_GetBitmapDimensionEx_5},
    {"c_CreateDIBPatternBrushPt", 3, hugsprim_CreateDIBPatternBrushPt_4},
    {"c_CreateCompatibleBitmap", 4, hugsprim_CreateCompatibleBitmap_3},
    {"c_CreateBitmapIndirect", 2, hugsprim_CreateBitmapIndirect_2},
    {"c_CreateBitmap", 6, hugsprim_CreateBitmap_1},
    {"c_DeleteBitmap", 2, hugsprim_DeleteObject_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGBitmap
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

