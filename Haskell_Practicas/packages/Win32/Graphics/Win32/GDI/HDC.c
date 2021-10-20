/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteDC
#endif

static void hugsprim_DeleteDC_40(HugsStackPtr);
static void hugsprim_DeleteDC_40(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DeleteDC(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateCompatibleDC
#endif

static void hugsprim_CreateCompatibleDC_39(HugsStackPtr);
static void hugsprim_CreateCompatibleDC_39(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CreateCompatibleDC(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CancelDC
#endif

static void hugsprim_CancelDC_38(HugsStackPtr);
static void hugsprim_CancelDC_38(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = CancelDC(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectClipPath
#endif

static void hugsprim_SelectClipPath_37(HugsStackPtr);
static void hugsprim_SelectClipPath_37(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = SelectClipPath(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ExtSelectClipRgn
#endif

static void hugsprim_ExtSelectClipRgn_36(HugsStackPtr);
static void hugsprim_ExtSelectClipRgn_36(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    res1 = ExtSelectClipRgn(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectClipRgn
#endif

static void hugsprim_SelectClipRgn_35(HugsStackPtr);
static void hugsprim_SelectClipRgn_35(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectClipRgn(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectObject
#endif

static void hugsprim_SelectObject_34(HugsStackPtr);
static void hugsprim_SelectObject_34(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectObject(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectPalette
#endif

static void hugsprim_SelectPalette_33(HugsStackPtr);
static void hugsprim_SelectPalette_33(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getBool();
    res1 = SelectPalette(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectObject
#endif

static void hugsprim_SelectObject_32(HugsStackPtr);
static void hugsprim_SelectObject_32(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectObject
#endif

static void hugsprim_SelectObject_31(HugsStackPtr);
static void hugsprim_SelectObject_31(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectObject
#endif

static void hugsprim_SelectObject_30(HugsStackPtr);
static void hugsprim_SelectObject_30(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SelectObject
#endif

static void hugsprim_SelectObject_29(HugsStackPtr);
static void hugsprim_SelectObject_29(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SelectObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCurrentObject
#endif

static void hugsprim_GetCurrentObject_28(HugsStackPtr);
static void hugsprim_GetCurrentObject_28(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetCurrentObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCurrentObject
#endif

static void hugsprim_GetCurrentObject_27(HugsStackPtr);
static void hugsprim_GetCurrentObject_27(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetCurrentObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCurrentObject
#endif

static void hugsprim_GetCurrentObject_26(HugsStackPtr);
static void hugsprim_GetCurrentObject_26(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetCurrentObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCurrentObject
#endif

static void hugsprim_GetCurrentObject_25(HugsStackPtr);
static void hugsprim_GetCurrentObject_25(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetCurrentObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCurrentObject
#endif

static void hugsprim_GetCurrentObject_24(HugsStackPtr);
static void hugsprim_GetCurrentObject_24(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = GetCurrentObject(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef RestoreDC
#endif

static void hugsprim_RestoreDC_23(HugsStackPtr);
static void hugsprim_RestoreDC_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = RestoreDC(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SaveDC
#endif

static void hugsprim_SaveDC_22(HugsStackPtr);
static void hugsprim_SaveDC_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt res1;
    arg1 = hugs->getPtr();
    res1 = SaveDC(arg1);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetMiterLimit
#endif

static void hugsprim_SetMiterLimit_21(HugsStackPtr);
static void hugsprim_SetMiterLimit_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsFloat arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getFloat();
    arg3 = hugs->getPtr();
    res1 = SetMiterLimit(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMiterLimit
#endif

static void hugsprim_GetMiterLimit_20(HugsStackPtr);
static void hugsprim_GetMiterLimit_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetMiterLimit(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetTextCharacterExtra
#endif

static void hugsprim_GetTextCharacterExtra_19(HugsStackPtr);
static void hugsprim_GetTextCharacterExtra_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt res1;
    arg1 = hugs->getPtr();
    res1 = GetTextCharacterExtra(arg1);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetTextCharacterExtra
#endif

static void hugsprim_SetTextCharacterExtra_18(HugsStackPtr);
static void hugsprim_SetTextCharacterExtra_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = SetTextCharacterExtra(arg1, arg2);
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetTextAlign
#endif

static void hugsprim_GetTextAlign_17(HugsStackPtr);
static void hugsprim_GetTextAlign_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetTextAlign(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetTextAlign
#endif

static void hugsprim_SetTextAlign_16(HugsStackPtr);
static void hugsprim_SetTextAlign_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = SetTextAlign(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetBrushOrgEx
#endif

static void hugsprim_GetBrushOrgEx_15(HugsStackPtr);
static void hugsprim_GetBrushOrgEx_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetBrushOrgEx(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetBrushOrgEx
#endif

static void hugsprim_SetBrushOrgEx_14(HugsStackPtr);
static void hugsprim_SetBrushOrgEx_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    arg4 = hugs->getPtr();
    res1 = SetBrushOrgEx(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetBkMode
#endif

static void hugsprim_GetBkMode_13(HugsStackPtr);
static void hugsprim_GetBkMode_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = GetBkMode(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetBkMode
#endif

static void hugsprim_SetBkMode_12(HugsStackPtr);
static void hugsprim_SetBkMode_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = SetBkMode(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetTextColor
#endif

static void hugsprim_GetTextColor_11(HugsStackPtr);
static void hugsprim_GetTextColor_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetTextColor(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetTextColor
#endif

static void hugsprim_SetTextColor_10(HugsStackPtr);
static void hugsprim_SetTextColor_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = SetTextColor(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetBkColor
#endif

static void hugsprim_GetBkColor_9(HugsStackPtr);
static void hugsprim_GetBkColor_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetBkColor(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetBkColor
#endif

static void hugsprim_SetBkColor_8(HugsStackPtr);
static void hugsprim_SetBkColor_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = SetBkColor(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetStretchBltMode
#endif

static void hugsprim_GetStretchBltMode_7(HugsStackPtr);
static void hugsprim_GetStretchBltMode_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = GetStretchBltMode(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetStretchBltMode
#endif

static void hugsprim_SetStretchBltMode_6(HugsStackPtr);
static void hugsprim_SetStretchBltMode_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = SetStretchBltMode(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetGraphicsMode
#endif

static void hugsprim_GetGraphicsMode_5(HugsStackPtr);
static void hugsprim_GetGraphicsMode_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetGraphicsMode(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetGraphicsMode
#endif

static void hugsprim_SetGraphicsMode_4(HugsStackPtr);
static void hugsprim_SetGraphicsMode_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = SetGraphicsMode(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetPolyFillMode
#endif

static void hugsprim_GetPolyFillMode_3(HugsStackPtr);
static void hugsprim_GetPolyFillMode_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = GetPolyFillMode(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetPolyFillMode
#endif

static void hugsprim_SetPolyFillMode_2(HugsStackPtr);
static void hugsprim_SetPolyFillMode_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = SetPolyFillMode(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetArcDirection
#endif

static void hugsprim_GetArcDirection_1(HugsStackPtr);
static void hugsprim_GetArcDirection_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = GetArcDirection(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetArcDirection
#endif

static void hugsprim_SetArcDirection_0(HugsStackPtr);
static void hugsprim_SetArcDirection_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = SetArcDirection(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_DeleteDC", 2, hugsprim_DeleteDC_40},
    {"c_CreateCompatibleDC", 2, hugsprim_CreateCompatibleDC_39},
    {"c_CancelDC", 2, hugsprim_CancelDC_38},
    {"c_SelectClipPath", 3, hugsprim_SelectClipPath_37},
    {"c_ExtSelectClipRgn", 4, hugsprim_ExtSelectClipRgn_36},
    {"c_SelectClipRgn", 3, hugsprim_SelectClipRgn_35},
    {"c_SelectRgn", 3, hugsprim_SelectObject_34},
    {"c_SelectPalette", 4, hugsprim_SelectPalette_33},
    {"c_SelectPen", 3, hugsprim_SelectObject_32},
    {"c_SelectFont", 3, hugsprim_SelectObject_31},
    {"c_SelectBrush", 3, hugsprim_SelectObject_30},
    {"c_SelectBitmap", 3, hugsprim_SelectObject_29},
    {"c_GetCurrentPen", 3, hugsprim_GetCurrentObject_28},
    {"c_GetCurrentPalette", 3, hugsprim_GetCurrentObject_27},
    {"c_GetCurrentFont", 3, hugsprim_GetCurrentObject_26},
    {"c_GetCurrentBrush", 3, hugsprim_GetCurrentObject_25},
    {"c_GetCurrentBitmap", 3, hugsprim_GetCurrentObject_24},
    {"c_RestoreDC", 3, hugsprim_RestoreDC_23},
    {"c_SaveDC", 2, hugsprim_SaveDC_22},
    {"c_SetMiterLimit", 4, hugsprim_SetMiterLimit_21},
    {"c_GetMiterLimit", 3, hugsprim_GetMiterLimit_20},
    {"c_GetTextCharacterExtra", 2, hugsprim_GetTextCharacterExtra_19},
    {"c_SetTextCharacterExtra", 3, hugsprim_SetTextCharacterExtra_18},
    {"c_GetTextAlign", 2, hugsprim_GetTextAlign_17},
    {"c_SetTextAlign", 3, hugsprim_SetTextAlign_16},
    {"c_GetBrushOrgEx", 3, hugsprim_GetBrushOrgEx_15},
    {"c_SetBrushOrgEx", 5, hugsprim_SetBrushOrgEx_14},
    {"c_GetBkMode", 2, hugsprim_GetBkMode_13},
    {"c_SetBkMode", 3, hugsprim_SetBkMode_12},
    {"c_GetTextColor", 2, hugsprim_GetTextColor_11},
    {"c_SetTextColor", 3, hugsprim_SetTextColor_10},
    {"c_GetBkColor", 2, hugsprim_GetBkColor_9},
    {"c_SetBkColor", 3, hugsprim_SetBkColor_8},
    {"c_GetStretchBltMode", 2, hugsprim_GetStretchBltMode_7},
    {"c_SetStretchBltMode", 3, hugsprim_SetStretchBltMode_6},
    {"c_GetGraphicsMode", 2, hugsprim_GetGraphicsMode_5},
    {"c_SetGraphicsMode", 3, hugsprim_SetGraphicsMode_4},
    {"c_GetPolyFillMode", 2, hugsprim_GetPolyFillMode_3},
    {"c_SetPolyFillMode", 3, hugsprim_SetPolyFillMode_2},
    {"c_GetArcDirection", 2, hugsprim_GetArcDirection_1},
    {"c_SetArcDirection", 3, hugsprim_SetArcDirection_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGHDC
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

