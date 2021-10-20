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
#undef SetDlgItemTextW
#endif

static void hugsprim_SetDlgItemTextW_21(HugsStackPtr);
static void hugsprim_SetDlgItemTextW_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getPtr();
    res1 = SetDlgItemTextW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetDlgItemInt
#endif

static void hugsprim_SetDlgItemInt_20(HugsStackPtr);
static void hugsprim_SetDlgItemInt_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsWord32 arg3;
    HsBool arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getWord32();
    arg4 = hugs->getBool();
    res1 = SetDlgItemInt(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SendDlgItemMessageW
#endif

static void hugsprim_SendDlgItemMessageW_19(HugsStackPtr);
static void hugsprim_SendDlgItemMessageW_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsInt32 arg5;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getInt32();
    res1 = SendDlgItemMessageW(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MapDialogRect
#endif

static void hugsprim_MapDialogRect_18(HugsStackPtr);
static void hugsprim_MapDialogRect_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = MapDialogRect(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef IsDialogMessageW
#endif

static void hugsprim_IsDialogMessageW_17(HugsStackPtr);
static void hugsprim_IsDialogMessageW_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = IsDialogMessageW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetNextDlgTabItem
#endif

static void hugsprim_GetNextDlgTabItem_16(HugsStackPtr);
static void hugsprim_GetNextDlgTabItem_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getBool();
    res1 = GetNextDlgTabItem(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetNextDlgGroupItem
#endif

static void hugsprim_GetNextDlgGroupItem_15(HugsStackPtr);
static void hugsprim_GetNextDlgGroupItem_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getBool();
    res1 = GetNextDlgGroupItem(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDlgItemTextW
#endif

static void hugsprim_GetDlgItemTextW_14(HugsStackPtr);
static void hugsprim_GetDlgItemTextW_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsPtr arg3;
    HsInt arg4;
    HsInt res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt();
    res1 = GetDlgItemTextW(arg1, arg2, arg3, arg4);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDlgItemInt
#endif

static void hugsprim_GetDlgItemInt_13(HugsStackPtr);
static void hugsprim_GetDlgItemInt_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsPtr arg3;
    HsBool arg4;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getPtr();
    arg4 = hugs->getBool();
    res1 = GetDlgItemInt(arg1, arg2, arg3, arg4);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDlgItem
#endif

static void hugsprim_GetDlgItem_12(HugsStackPtr);
static void hugsprim_GetDlgItem_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = GetDlgItem(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDlgCtrlID
#endif

static void hugsprim_GetDlgCtrlID_11(HugsStackPtr);
static void hugsprim_GetDlgCtrlID_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt res1;
    arg1 = hugs->getPtr();
    res1 = GetDlgCtrlID(arg1);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDialogBaseUnits
#endif

static void hugsprim_GetDialogBaseUnits_10(HugsStackPtr);
static void hugsprim_GetDialogBaseUnits_10(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = GetDialogBaseUnits();
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EndDialog
#endif

static void hugsprim_EndDialog_9(HugsStackPtr);
static void hugsprim_EndDialog_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = EndDialog(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DefDlgProcW
#endif

static void hugsprim_DefDlgProcW_8(HugsStackPtr);
static void hugsprim_DefDlgProcW_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    res1 = DefDlgProcW(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDialogIndirectParamW
#endif

static void hugsprim_CreateDialogIndirectParamW_7(HugsStackPtr);
static void hugsprim_CreateDialogIndirectParamW_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsFunPtr arg4;
    HsInt32 arg5;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getFunPtr();
    arg5 = hugs->getInt32();
    res1 = CreateDialogIndirectParamW(arg1, arg2, arg3, arg4, arg5);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDialogParamW
#endif

static void hugsprim_CreateDialogParamW_6(HugsStackPtr);
static void hugsprim_CreateDialogParamW_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsFunPtr arg4;
    HsInt32 arg5;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getFunPtr();
    arg5 = hugs->getInt32();
    res1 = CreateDialogParamW(arg1, arg2, arg3, arg4, arg5);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}
#include "diatemp.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef addDiaControl
#endif

static void hugsprim_addDiaControl_5(HugsStackPtr);
static void hugsprim_addDiaControl_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsPtr arg4;
    HsWord32 arg5;
    HsInt arg6;
    HsInt arg7;
    HsInt arg8;
    HsInt arg9;
    HsWord32 arg10;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    arg4 = hugs->getPtr();
    arg5 = hugs->getWord32();
    arg6 = hugs->getInt();
    arg7 = hugs->getInt();
    arg8 = hugs->getInt();
    arg9 = hugs->getInt();
    arg10 = hugs->getWord32();
    res1 = addDiaControl(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef mkDiaTemplate
#endif

static void hugsprim_mkDiaTemplate_4(HugsStackPtr);
static void hugsprim_mkDiaTemplate_4(HugsStackPtr hugs_root)
{
    HsInt arg1;
    HsInt arg2;
    HsInt arg3;
    HsInt arg4;
    HsInt arg5;
    HsWord32 arg6;
    HsWord32 arg7;
    HsPtr arg8;
    HsPtr arg9;
    HsPtr arg10;
    HsPtr arg11;
    HsInt arg12;
    HsPtr res1;
    arg1 = hugs->getInt();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    arg6 = hugs->getWord32();
    arg7 = hugs->getWord32();
    arg8 = hugs->getPtr();
    arg9 = hugs->getPtr();
    arg10 = hugs->getPtr();
    arg11 = hugs->getPtr();
    arg12 = hugs->getInt();
    res1 = mkDiaTemplate(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getFinalDialog
#endif

static void hugsprim_getFinalDialog_3(HugsStackPtr);
static void hugsprim_getFinalDialog_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = getFinalDialog(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DialogBoxIndirectParamW
#endif

static void hugsprim_DialogBoxIndirectParamW_2(HugsStackPtr);
static void hugsprim_DialogBoxIndirectParamW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsFunPtr arg4;
    HsInt32 arg5;
    HsInt res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getFunPtr();
    arg5 = hugs->getInt32();
    res1 = DialogBoxIndirectParamW(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DialogBoxParamW
#endif

static void hugsprim_DialogBoxParamW_1(HugsStackPtr);
static void hugsprim_DialogBoxParamW_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsFunPtr arg4;
    HsInt32 arg5;
    HsInt res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getFunPtr();
    arg5 = hugs->getInt32();
    res1 = DialogBoxParamW(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

static HsInt v6974(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsWord32 arg2, HsWord32 arg3, HsInt32 arg4);
static HsInt v6974(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsWord32 arg2, HsWord32 arg3, HsInt32 arg4)
{
    HsInt res1;
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    hugs->putWord32(arg2);
    hugs->putWord32(arg3);
    hugs->putInt32(arg4);
    if (hugs->runIO(4)) {
        exit(hugs->getInt());
    }
    res1 = hugs->getInt();
    return res1;
}

static void hugsprim_v6974_0(HugsStackPtr);
static void hugsprim_v6974_0(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v6974,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_SetDlgItemText", 4, hugsprim_SetDlgItemTextW_21},
    {"c_SetDlgItemInt", 5, hugsprim_SetDlgItemInt_20},
    {"sendDlgItemMessage", 6, hugsprim_SendDlgItemMessageW_19},
    {"c_MapDialogRect", 3, hugsprim_MapDialogRect_18},
    {"isDialogMessage", 3, hugsprim_IsDialogMessageW_17},
    {"c_GetNextDlgTabItem", 4, hugsprim_GetNextDlgTabItem_16},
    {"c_GetNextDlgGroupItem", 4, hugsprim_GetNextDlgGroupItem_15},
    {"c_GetDlgItemText", 5, hugsprim_GetDlgItemTextW_14},
    {"c_GetDlgItemInt", 5, hugsprim_GetDlgItemInt_13},
    {"c_GetDlgItem", 3, hugsprim_GetDlgItem_12},
    {"c_GetDlgCtrlID", 2, hugsprim_GetDlgCtrlID_11},
    {"getDialogBaseUnits", 1, hugsprim_GetDialogBaseUnits_10},
    {"c_EndDialog", 3, hugsprim_EndDialog_9},
    {"defDlgProc", 5, hugsprim_DefDlgProcW_8},
    {"c_CreateDialogIndirectParam", 6, hugsprim_CreateDialogIndirectParamW_7},
    {"c_CreateDialogParam", 6, hugsprim_CreateDialogParamW_6},
    {"addDiaControl", 11, hugsprim_addDiaControl_5},
    {"mkDiaTemplate", 13, hugsprim_mkDiaTemplate_4},
    {"getFinalDialog", 2, hugsprim_getFinalDialog_3},
    {"c_DialogBoxIndirectParam", 6, hugsprim_DialogBoxIndirectParamW_2},
    {"c_DialogBoxParam", 6, hugsprim_DialogBoxParamW_1},
    {"mkDialogClosure", 2, hugsprim_v6974_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWDialogue
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

