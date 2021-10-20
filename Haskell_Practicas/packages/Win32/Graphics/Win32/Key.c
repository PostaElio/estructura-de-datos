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
#undef IsWindowEnabled
#endif

static void hugsprim_IsWindowEnabled_5(HugsStackPtr);
static void hugsprim_IsWindowEnabled_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = IsWindowEnabled(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetKBCodePage
#endif

static void hugsprim_GetKBCodePage_4(HugsStackPtr);
static void hugsprim_GetKBCodePage_4(HugsStackPtr hugs_root)
{
    HsWord32 res1;
    res1 = GetKBCodePage();
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetFocus
#endif

static void hugsprim_GetFocus_3(HugsStackPtr);
static void hugsprim_GetFocus_3(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetFocus();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetAsyncKeyState
#endif

static void hugsprim_GetAsyncKeyState_2(HugsStackPtr);
static void hugsprim_GetAsyncKeyState_2(HugsStackPtr hugs_root)
{
    HsInt arg1;
    HsWord16 res1;
    arg1 = hugs->getInt();
    res1 = GetAsyncKeyState(arg1);
    hugs->putWord16(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetActiveWindow
#endif

static void hugsprim_GetActiveWindow_1(HugsStackPtr);
static void hugsprim_GetActiveWindow_1(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetActiveWindow();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EnableWindow
#endif

static void hugsprim_EnableWindow_0(HugsStackPtr);
static void hugsprim_EnableWindow_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    res1 = EnableWindow(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"isWindowEnabled", 2, hugsprim_IsWindowEnabled_5},
    {"getKBCodePage", 1, hugsprim_GetKBCodePage_4},
    {"c_GetFocus", 1, hugsprim_GetFocus_3},
    {"getAsyncKeyState", 2, hugsprim_GetAsyncKeyState_2},
    {"c_GetActiveWindow", 1, hugsprim_GetActiveWindow_1},
    {"enableWindow", 3, hugsprim_EnableWindow_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWKey
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

