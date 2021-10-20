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
#undef RemoveMenu
#endif

static void hugsprim_RemoveMenu_30(HugsStackPtr);
static void hugsprim_RemoveMenu_30(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    res1 = RemoveMenu(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ModifyMenuW
#endif

static void hugsprim_ModifyMenuW_29(HugsStackPtr);
static void hugsprim_ModifyMenuW_29(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getPtr();
    res1 = ModifyMenuW(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef InsertMenuW
#endif

static void hugsprim_InsertMenuW_28(HugsStackPtr);
static void hugsprim_InsertMenuW_28(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getPtr();
    res1 = InsertMenuW(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AppendMenuW
#endif

static void hugsprim_AppendMenuW_27(HugsStackPtr);
static void hugsprim_AppendMenuW_27(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    res1 = AppendMenuW(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef TrackPopupMenuEx
#endif

static void hugsprim_TrackPopupMenuEx_26(HugsStackPtr);
static void hugsprim_TrackPopupMenuEx_26(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsInt arg3;
    HsInt arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    res1 = TrackPopupMenuEx(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef TrackPopupMenu
#endif

static void hugsprim_TrackPopupMenu_25(HugsStackPtr);
static void hugsprim_TrackPopupMenu_25(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsInt arg3;
    HsInt arg4;
    HsInt arg5;
    HsPtr arg6;
    HsPtr arg7;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    arg6 = hugs->getPtr();
    arg7 = hugs->getPtr();
    res1 = TrackPopupMenu(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetMenuItemInfoW
#endif

static void hugsprim_SetMenuItemInfoW_24(HugsStackPtr);
static void hugsprim_SetMenuItemInfoW_24(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    arg4 = hugs->getPtr();
    res1 = SetMenuItemInfoW(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteMenu
#endif

static void hugsprim_DeleteMenu_23(HugsStackPtr);
static void hugsprim_DeleteMenu_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    res1 = DeleteMenu(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DestroyMenu
#endif

static void hugsprim_DestroyMenu_22(HugsStackPtr);
static void hugsprim_DestroyMenu_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DestroyMenu(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetMenuItemBitmaps
#endif

static void hugsprim_SetMenuItemBitmaps_21(HugsStackPtr);
static void hugsprim_SetMenuItemBitmaps_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    res1 = SetMenuItemBitmaps(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetMenuDefaultItem
#endif

static void hugsprim_SetMenuDefaultItem_20(HugsStackPtr);
static void hugsprim_SetMenuDefaultItem_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    res1 = SetMenuDefaultItem(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LoadMenuW
#endif

static void hugsprim_LoadMenuW_19(HugsStackPtr);
static void hugsprim_LoadMenuW_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = LoadMenuW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef InsertMenuItemW
#endif

static void hugsprim_InsertMenuItemW_18(HugsStackPtr);
static void hugsprim_InsertMenuItemW_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    arg4 = hugs->getPtr();
    res1 = InsertMenuItemW(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef HiliteMenuItem
#endif

static void hugsprim_HiliteMenuItem_17(HugsStackPtr);
static void hugsprim_HiliteMenuItem_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    res1 = HiliteMenuItem(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuItemRect
#endif

static void hugsprim_GetMenuItemRect_16(HugsStackPtr);
static void hugsprim_GetMenuItemRect_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    res1 = GetMenuItemRect(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuItemInfoW
#endif

static void hugsprim_GetMenuItemInfoW_15(HugsStackPtr);
static void hugsprim_GetMenuItemInfoW_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    arg4 = hugs->getPtr();
    res1 = GetMenuItemInfoW(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuItemID
#endif

static void hugsprim_GetMenuItemID_14(HugsStackPtr);
static void hugsprim_GetMenuItemID_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetMenuItemID(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuItemCount
#endif

static void hugsprim_GetMenuItemCount_13(HugsStackPtr);
static void hugsprim_GetMenuItemCount_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt res1;
    arg1 = hugs->getPtr();
    res1 = GetMenuItemCount(arg1);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetMenu
#endif

static void hugsprim_SetMenu_12(HugsStackPtr);
static void hugsprim_SetMenu_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SetMenu(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetSubMenu
#endif

static void hugsprim_GetSubMenu_11(HugsStackPtr);
static void hugsprim_GetSubMenu_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetSubMenu(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuState
#endif

static void hugsprim_GetMenuState_10(HugsStackPtr);
static void hugsprim_GetMenuState_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    res1 = GetMenuState(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenuDefaultItem
#endif

static void hugsprim_GetMenuDefaultItem_9(HugsStackPtr);
static void hugsprim_GetMenuDefaultItem_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsWord32 arg3;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    arg3 = hugs->getWord32();
    res1 = GetMenuDefaultItem(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMenu
#endif

static void hugsprim_GetMenu_8(HugsStackPtr);
static void hugsprim_GetMenu_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetMenu(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetSystemMenu
#endif

static void hugsprim_GetSystemMenu_7(HugsStackPtr);
static void hugsprim_GetSystemMenu_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    res1 = GetSystemMenu(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef IsMenu
#endif

static void hugsprim_IsMenu_6(HugsStackPtr);
static void hugsprim_IsMenu_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = IsMenu(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EnableMenuItem
#endif

static void hugsprim_EnableMenuItem_5(HugsStackPtr);
static void hugsprim_EnableMenuItem_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    res1 = EnableMenuItem(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DrawMenuBar
#endif

static void hugsprim_DrawMenuBar_4(HugsStackPtr);
static void hugsprim_DrawMenuBar_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DrawMenuBar(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreatePopupMenu
#endif

static void hugsprim_CreatePopupMenu_3(HugsStackPtr);
static void hugsprim_CreatePopupMenu_3(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = CreatePopupMenu();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateMenu
#endif

static void hugsprim_CreateMenu_2(HugsStackPtr);
static void hugsprim_CreateMenu_2(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = CreateMenu();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CheckMenuRadioItem
#endif

static void hugsprim_CheckMenuRadioItem_1(HugsStackPtr);
static void hugsprim_CheckMenuRadioItem_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsWord32 arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getWord32();
    res1 = CheckMenuRadioItem(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CheckMenuItem
#endif

static void hugsprim_CheckMenuItem_0(HugsStackPtr);
static void hugsprim_CheckMenuItem_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    res1 = CheckMenuItem(arg1, arg2, arg3);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_RemoveMenu", 4, hugsprim_RemoveMenu_30},
    {"c_ModifyMenu", 6, hugsprim_ModifyMenuW_29},
    {"c_InsertMenu", 6, hugsprim_InsertMenuW_28},
    {"c_AppendMenu", 5, hugsprim_AppendMenuW_27},
    {"c_TrackPopupMenuEx", 7, hugsprim_TrackPopupMenuEx_26},
    {"c_TrackPopupMenu", 8, hugsprim_TrackPopupMenu_25},
    {"c_SetMenuItemInfo", 5, hugsprim_SetMenuItemInfoW_24},
    {"c_DeleteMenu", 4, hugsprim_DeleteMenu_23},
    {"c_DestroyMenu", 2, hugsprim_DestroyMenu_22},
    {"c_SetMenuItemBitmaps", 6, hugsprim_SetMenuItemBitmaps_21},
    {"c_SetMenuDefaultItem", 4, hugsprim_SetMenuDefaultItem_20},
    {"c_LoadMenu", 3, hugsprim_LoadMenuW_19},
    {"c_InsertMenuItem", 5, hugsprim_InsertMenuItemW_18},
    {"hiliteMenuItem", 5, hugsprim_HiliteMenuItem_17},
    {"c_GetMenuItemRect", 5, hugsprim_GetMenuItemRect_16},
    {"c_GetMenuItemInfo", 5, hugsprim_GetMenuItemInfoW_15},
    {"c_GetMenuItemID", 3, hugsprim_GetMenuItemID_14},
    {"c_GetMenuItemCount", 2, hugsprim_GetMenuItemCount_13},
    {"c_SetMenu", 3, hugsprim_SetMenu_12},
    {"c_GetSubMenu", 3, hugsprim_GetSubMenu_11},
    {"c_GetMenuState", 4, hugsprim_GetMenuState_10},
    {"c_GetMenuDefaultItem", 4, hugsprim_GetMenuDefaultItem_9},
    {"c_GetMenu", 2, hugsprim_GetMenu_8},
    {"c_GetSystemMenu", 3, hugsprim_GetSystemMenu_7},
    {"isMenu", 2, hugsprim_IsMenu_6},
    {"c_EnableMenuItem", 4, hugsprim_EnableMenuItem_5},
    {"c_DrawMenuBar", 2, hugsprim_DrawMenuBar_4},
    {"c_CreatePopupMenu", 1, hugsprim_CreatePopupMenu_3},
    {"c_CreateMenu", 1, hugsprim_CreateMenu_2},
    {"c_CheckMenuRadioItem", 6, hugsprim_CheckMenuRadioItem_1},
    {"c_CheckMenuItem", 4, hugsprim_CheckMenuItem_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWMenu
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

