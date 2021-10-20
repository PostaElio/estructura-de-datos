/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"
#include "gettime.h"
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef timeGetTime
#endif

static void hugsprim_timeGetTime_15(HugsStackPtr);
static void hugsprim_timeGetTime_15(HugsStackPtr hugs_root)
{
    HsWord32 res1;
    res1 = timeGetTime();
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef KillTimer
#endif

static void hugsprim_KillTimer_14(HugsStackPtr);
static void hugsprim_KillTimer_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = KillTimer(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetTimer
#endif

static void hugsprim_SetTimer_13(HugsStackPtr);
static void hugsprim_SetTimer_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsFunPtr arg4;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getFunPtr();
    res1 = SetTimer(arg1, arg2, arg3, arg4);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Beep
#endif

static void hugsprim_Beep_12(HugsStackPtr);
static void hugsprim_Beep_12(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsInt arg2;
    HsBool res1;
    arg1 = hugs->getWord16();
    arg2 = hugs->getInt();
    res1 = Beep(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MessageBeep
#endif

static void hugsprim_MessageBeep_11(HugsStackPtr);
static void hugsprim_MessageBeep_11(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    MessageBeep(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ExitWindowsEx
#endif

static void hugsprim_ExitWindowsEx_10(HugsStackPtr);
static void hugsprim_ExitWindowsEx_10(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsBool res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    res1 = ExitWindowsEx(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClipCursor
#endif

static void hugsprim_GetClipCursor_9(HugsStackPtr);
static void hugsprim_GetClipCursor_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = GetClipCursor(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ClipCursor
#endif

static void hugsprim_ClipCursor_8(HugsStackPtr);
static void hugsprim_ClipCursor_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = ClipCursor(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetCursorPos
#endif

static void hugsprim_SetCursorPos_7(HugsStackPtr);
static void hugsprim_SetCursorPos_7(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsBool res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = SetCursorPos(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCursorPos
#endif

static void hugsprim_GetCursorPos_6(HugsStackPtr);
static void hugsprim_GetCursorPos_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = GetCursorPos(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}
#include "ellipse.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef transformedEllipse
#endif

static void hugsprim_transformedEllipse_5(HugsStackPtr);
static void hugsprim_transformedEllipse_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    res1 = transformedEllipse(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetStdHandle
#endif

static void hugsprim_GetStdHandle_4(HugsStackPtr);
static void hugsprim_GetStdHandle_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr res1;
    arg1 = hugs->getWord32();
    res1 = GetStdHandle(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MessageBoxW
#endif

static void hugsprim_MessageBoxW_3(HugsStackPtr);
static void hugsprim_MessageBoxW_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord32 arg4;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getWord32();
    res1 = MessageBoxW(arg1, arg2, arg3, arg4);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadIconW
#endif

static void hugsprim_LoadIconW_2(HugsStackPtr);
static void hugsprim_LoadIconW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = LoadIconW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadCursorW
#endif

static void hugsprim_LoadCursorW_1(HugsStackPtr);
static void hugsprim_LoadCursorW_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = LoadCursorW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadAcceleratorsW
#endif

static void hugsprim_LoadAcceleratorsW_0(HugsStackPtr);
static void hugsprim_LoadAcceleratorsW_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = LoadAcceleratorsW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"timeGetTime", 1, hugsprim_timeGetTime_15},
    {"c_KillTimer", 3, hugsprim_KillTimer_14},
    {"c_SetTimer", 5, hugsprim_SetTimer_13},
    {"c_Beep", 3, hugsprim_Beep_12},
    {"c_MessageBeep", 2, hugsprim_MessageBeep_11},
    {"c_ExitWindowsEx", 3, hugsprim_ExitWindowsEx_10},
    {"c_GetClipCursor", 2, hugsprim_GetClipCursor_9},
    {"c_ClipCursor", 2, hugsprim_ClipCursor_8},
    {"c_SetCursorPos", 3, hugsprim_SetCursorPos_7},
    {"c_GetCursorPos", 2, hugsprim_GetCursorPos_6},
    {"c_transformedEllipse", 8, hugsprim_transformedEllipse_5},
    {"c_GetStdHandle", 2, hugsprim_GetStdHandle_4},
    {"c_MessageBox", 5, hugsprim_MessageBoxW_3},
    {"c_LoadIcon", 3, hugsprim_LoadIconW_2},
    {"c_LoadCursor", 3, hugsprim_LoadCursorW_1},
    {"c_LoadAccelerators", 3, hugsprim_LoadAcceleratorsW_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWMisc
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

