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
#undef LoadLibraryExW
#endif

static void hugsprim_LoadLibraryExW_6(HugsStackPtr);
static void hugsprim_LoadLibraryExW_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = LoadLibraryExW(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadLibraryW
#endif

static void hugsprim_LoadLibraryW_5(HugsStackPtr);
static void hugsprim_LoadLibraryW_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = LoadLibraryW(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetProcAddress
#endif

static void hugsprim_GetProcAddress_4(HugsStackPtr);
static void hugsprim_GetProcAddress_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetProcAddress(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetModuleHandleW
#endif

static void hugsprim_GetModuleHandleW_3(HugsStackPtr);
static void hugsprim_GetModuleHandleW_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetModuleHandleW(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetModuleFileNameW
#endif

static void hugsprim_GetModuleFileNameW_2(HugsStackPtr);
static void hugsprim_GetModuleFileNameW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = GetModuleFileNameW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FreeLibrary
#endif

static void hugsprim_FreeLibrary_1(HugsStackPtr);
static void hugsprim_FreeLibrary_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FreeLibrary(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DisableThreadLibraryCalls
#endif

static void hugsprim_DisableThreadLibraryCalls_0(HugsStackPtr);
static void hugsprim_DisableThreadLibraryCalls_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DisableThreadLibraryCalls(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_LoadLibraryEx", 4, hugsprim_LoadLibraryExW_6},
    {"c_LoadLibrary", 2, hugsprim_LoadLibraryW_5},
    {"c_GetProcAddress", 3, hugsprim_GetProcAddress_4},
    {"c_GetModuleHandle", 2, hugsprim_GetModuleHandleW_3},
    {"c_GetModuleFileName", 4, hugsprim_GetModuleFileNameW_2},
    {"c_FreeLibrary", 2, hugsprim_FreeLibrary_1},
    {"c_DisableThreadLibraryCalls", 2, hugsprim_DisableThreadLibraryCalls_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initSWDLL
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

