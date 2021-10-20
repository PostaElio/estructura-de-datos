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
#undef SetClipboardViewer
#endif

static void hugsprim_SetClipboardViewer_15(HugsStackPtr);
static void hugsprim_SetClipboardViewer_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = SetClipboardViewer(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetClipboardData
#endif

static void hugsprim_SetClipboardData_14(HugsStackPtr);
static void hugsprim_SetClipboardData_14(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    res1 = SetClipboardData(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef RegisterClipboardFormatW
#endif

static void hugsprim_RegisterClipboardFormatW_13(HugsStackPtr);
static void hugsprim_RegisterClipboardFormatW_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = RegisterClipboardFormatW(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef OpenClipboard
#endif

static void hugsprim_OpenClipboard_12(HugsStackPtr);
static void hugsprim_OpenClipboard_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = OpenClipboard(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef IsClipboardFormatAvailable
#endif

static void hugsprim_IsClipboardFormatAvailable_11(HugsStackPtr);
static void hugsprim_IsClipboardFormatAvailable_11(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsBool res1;
    arg1 = hugs->getWord32();
    res1 = IsClipboardFormatAvailable(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetPriorityClipboardFormat
#endif

static void hugsprim_GetPriorityClipboardFormat_10(HugsStackPtr);
static void hugsprim_GetPriorityClipboardFormat_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = GetPriorityClipboardFormat(arg1, arg2);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetOpenClipboardWindow
#endif

static void hugsprim_GetOpenClipboardWindow_9(HugsStackPtr);
static void hugsprim_GetOpenClipboardWindow_9(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetOpenClipboardWindow();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClipboardViewer
#endif

static void hugsprim_GetClipboardViewer_8(HugsStackPtr);
static void hugsprim_GetClipboardViewer_8(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetClipboardViewer();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClipboardOwner
#endif

static void hugsprim_GetClipboardOwner_7(HugsStackPtr);
static void hugsprim_GetClipboardOwner_7(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetClipboardOwner();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClipboardFormatNameW
#endif

static void hugsprim_GetClipboardFormatNameW_6(HugsStackPtr);
static void hugsprim_GetClipboardFormatNameW_6(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    HsInt arg3;
    HsInt res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = GetClipboardFormatNameW(arg1, arg2, arg3);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClipboardData
#endif

static void hugsprim_GetClipboardData_5(HugsStackPtr);
static void hugsprim_GetClipboardData_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr res1;
    arg1 = hugs->getWord32();
    res1 = GetClipboardData(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EnumClipboardFormats
#endif

static void hugsprim_EnumClipboardFormats_4(HugsStackPtr);
static void hugsprim_EnumClipboardFormats_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 res1;
    arg1 = hugs->getWord32();
    res1 = EnumClipboardFormats(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EmptyClipboard
#endif

static void hugsprim_EmptyClipboard_3(HugsStackPtr);
static void hugsprim_EmptyClipboard_3(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = EmptyClipboard();
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CountClipboardFormats
#endif

static void hugsprim_CountClipboardFormats_2(HugsStackPtr);
static void hugsprim_CountClipboardFormats_2(HugsStackPtr hugs_root)
{
    HsInt res1;
    res1 = CountClipboardFormats();
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CloseClipboard
#endif

static void hugsprim_CloseClipboard_1(HugsStackPtr);
static void hugsprim_CloseClipboard_1(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = CloseClipboard();
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ChangeClipboardChain
#endif

static void hugsprim_ChangeClipboardChain_0(HugsStackPtr);
static void hugsprim_ChangeClipboardChain_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = ChangeClipboardChain(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_SetClipboardViewer", 2, hugsprim_SetClipboardViewer_15},
    {"c_SetClipboardData", 3, hugsprim_SetClipboardData_14},
    {"c_RegisterClipboardFormat", 2, hugsprim_RegisterClipboardFormatW_13},
    {"c_OpenClipboard", 2, hugsprim_OpenClipboard_12},
    {"isClipboardFormatAvailable", 2, hugsprim_IsClipboardFormatAvailable_11},
    {"c_GetPriorityClipboardFormat", 3, hugsprim_GetPriorityClipboardFormat_10},
    {"c_GetOpenClipboardWindow", 1, hugsprim_GetOpenClipboardWindow_9},
    {"c_GetClipboardViewer", 1, hugsprim_GetClipboardViewer_8},
    {"c_GetClipboardOwner", 1, hugsprim_GetClipboardOwner_7},
    {"c_GetClipboardFormatName", 4, hugsprim_GetClipboardFormatNameW_6},
    {"c_GetClipboardData", 2, hugsprim_GetClipboardData_5},
    {"c_EnumClipboardFormats", 2, hugsprim_EnumClipboardFormats_4},
    {"c_EmptyClipboard", 1, hugsprim_EmptyClipboard_3},
    {"countClipboardFormats", 1, hugsprim_CountClipboardFormats_2},
    {"c_CloseClipboard", 1, hugsprim_CloseClipboard_1},
    {"changeClipboardChain", 3, hugsprim_ChangeClipboardChain_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGClip
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

