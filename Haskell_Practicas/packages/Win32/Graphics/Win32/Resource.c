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
#undef UpdateResourceW
#endif

static void hugsprim_UpdateResourceW_9(HugsStackPtr);
static void hugsprim_UpdateResourceW_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord16 arg4;
    HsPtr arg5;
    HsWord32 arg6;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getWord16();
    arg5 = hugs->getPtr();
    arg6 = hugs->getWord32();
    res1 = UpdateResourceW(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SizeofResource
#endif

static void hugsprim_SizeofResource_8(HugsStackPtr);
static void hugsprim_SizeofResource_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SizeofResource(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LockResource
#endif

static void hugsprim_LockResource_7(HugsStackPtr);
static void hugsprim_LockResource_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = LockResource(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadResource
#endif

static void hugsprim_LoadResource_6(HugsStackPtr);
static void hugsprim_LoadResource_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = LoadResource(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadImageW
#endif

static void hugsprim_LoadImageW_5(HugsStackPtr);
static void hugsprim_LoadImageW_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt arg4;
    HsInt arg5;
    HsWord32 arg6;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    arg6 = hugs->getWord32();
    res1 = LoadImageW(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindResourceExW
#endif

static void hugsprim_FindResourceExW_4(HugsStackPtr);
static void hugsprim_FindResourceExW_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord16 arg4;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getWord16();
    res1 = FindResourceExW(arg1, arg2, arg3, arg4);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindResourceW
#endif

static void hugsprim_FindResourceW_3(HugsStackPtr);
static void hugsprim_FindResourceW_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = FindResourceW(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EndUpdateResourceW
#endif

static void hugsprim_EndUpdateResourceW_2(HugsStackPtr);
static void hugsprim_EndUpdateResourceW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    res1 = EndUpdateResourceW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CopyImage
#endif

static void hugsprim_CopyImage_1(HugsStackPtr);
static void hugsprim_CopyImage_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsInt arg3;
    HsInt arg4;
    HsWord32 arg5;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    arg5 = hugs->getWord32();
    res1 = CopyImage(arg1, arg2, arg3, arg4, arg5);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BeginUpdateResourceW
#endif

static void hugsprim_BeginUpdateResourceW_0(HugsStackPtr);
static void hugsprim_BeginUpdateResourceW_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    res1 = BeginUpdateResourceW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_UpdateResource", 7, hugsprim_UpdateResourceW_9},
    {"c_SizeofResource", 3, hugsprim_SizeofResource_8},
    {"c_LockResource", 2, hugsprim_LockResource_7},
    {"c_LoadResource", 3, hugsprim_LoadResource_6},
    {"c_LoadImage", 7, hugsprim_LoadImageW_5},
    {"c_FindResourceEx", 5, hugsprim_FindResourceExW_4},
    {"c_FindResource", 4, hugsprim_FindResourceW_3},
    {"c_EndUpdateResource", 3, hugsprim_EndUpdateResourceW_2},
    {"c_CopyImage", 6, hugsprim_CopyImage_1},
    {"c_BeginUpdateResource", 3, hugsprim_BeginUpdateResourceW_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWResource
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

