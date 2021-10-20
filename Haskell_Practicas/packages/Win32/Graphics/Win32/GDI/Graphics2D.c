/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef GetTextExtentPoint32W
#endif

static void hugsprim_GetTextExtentPoint32W_23(HugsStackPtr);
static void hugsprim_GetTextExtentPoint32W_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    arg4 = hugs->getPtr();
    res1 = GetTextExtentPoint32W(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef TextOutW
#endif

static void hugsprim_TextOutW_22(HugsStackPtr);
static void hugsprim_TextOutW_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    HsInt arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getInt();
    res1 = TextOutW(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PlgBlt
#endif

static void hugsprim_PlgBlt_21(HugsStackPtr);
static void hugsprim_PlgBlt_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsPtr arg8;
    HsInt32 arg9;
    HsInt32 arg10;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getPtr();
    arg9 = hugs->getInt32();
    arg10 = hugs->getInt32();
    res1 = PlgBlt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef StretchBlt
#endif

static void hugsprim_StretchBlt_20(HugsStackPtr);
static void hugsprim_StretchBlt_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsPtr arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsInt32 arg10;
    HsWord32 arg11;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getPtr();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    arg10 = hugs->getInt32();
    arg11 = hugs->getWord32();
    res1 = StretchBlt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MaskBlt
#endif

static void hugsprim_MaskBlt_19(HugsStackPtr);
static void hugsprim_MaskBlt_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsPtr arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsPtr arg9;
    HsInt32 arg10;
    HsInt32 arg11;
    HsWord32 arg12;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getPtr();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getPtr();
    arg10 = hugs->getInt32();
    arg11 = hugs->getInt32();
    arg12 = hugs->getWord32();
    res1 = MaskBlt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BitBlt
#endif

static void hugsprim_BitBlt_18(HugsStackPtr);
static void hugsprim_BitBlt_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsPtr arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsWord32 arg9;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getPtr();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getWord32();
    res1 = BitBlt(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Pie
#endif

static void hugsprim_Pie_17(HugsStackPtr);
static void hugsprim_Pie_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    res1 = Pie(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Chord
#endif

static void hugsprim_Chord_16(HugsStackPtr);
static void hugsprim_Chord_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    res1 = Chord(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Ellipse
#endif

static void hugsprim_Ellipse_15(HugsStackPtr);
static void hugsprim_Ellipse_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    res1 = Ellipse(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef RoundRect
#endif

static void hugsprim_RoundRect_14(HugsStackPtr);
static void hugsprim_RoundRect_14(HugsStackPtr hugs_root)
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
    res1 = RoundRect(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Rectangle
#endif

static void hugsprim_Rectangle_13(HugsStackPtr);
static void hugsprim_Rectangle_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    res1 = Rectangle(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef InvertRect
#endif

static void hugsprim_InvertRect_12(HugsStackPtr);
static void hugsprim_InvertRect_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = InvertRect(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FrameRect
#endif

static void hugsprim_FrameRect_11(HugsStackPtr);
static void hugsprim_FrameRect_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = FrameRect(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FillRect
#endif

static void hugsprim_FillRect_10(HugsStackPtr);
static void hugsprim_FillRect_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = FillRect(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AngleArc
#endif

static void hugsprim_AngleArc_9(HugsStackPtr);
static void hugsprim_AngleArc_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsWord16 arg4;
    HsDouble arg5;
    HsDouble arg6;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getWord16();
    arg5 = hugs->getDouble();
    arg6 = hugs->getDouble();
    res1 = AngleArc(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ArcTo
#endif

static void hugsprim_ArcTo_8(HugsStackPtr);
static void hugsprim_ArcTo_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    res1 = ArcTo(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Arc
#endif

static void hugsprim_Arc_7(HugsStackPtr);
static void hugsprim_Arc_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsInt32 arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsInt32 arg8;
    HsInt32 arg9;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getInt32();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getInt32();
    arg9 = hugs->getInt32();
    res1 = Arc(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PolyBezierTo
#endif

static void hugsprim_PolyBezierTo_6(HugsStackPtr);
static void hugsprim_PolyBezierTo_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = PolyBezierTo(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PolyBezier
#endif

static void hugsprim_PolyBezier_5(HugsStackPtr);
static void hugsprim_PolyBezier_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = PolyBezier(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Polygon
#endif

static void hugsprim_Polygon_4(HugsStackPtr);
static void hugsprim_Polygon_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = Polygon(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PolylineTo
#endif

static void hugsprim_PolylineTo_3(HugsStackPtr);
static void hugsprim_PolylineTo_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = PolylineTo(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef Polyline
#endif

static void hugsprim_Polyline_2(HugsStackPtr);
static void hugsprim_Polyline_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt();
    res1 = Polyline(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef LineTo
#endif

static void hugsprim_LineTo_1(HugsStackPtr);
static void hugsprim_LineTo_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = LineTo(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MoveToEx
#endif

static void hugsprim_MoveToEx_0(HugsStackPtr);
static void hugsprim_MoveToEx_0(HugsStackPtr hugs_root)
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
    res1 = MoveToEx(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_GetTextExtentPoint32", 5, hugsprim_GetTextExtentPoint32W_23},
    {"c_TextOut", 6, hugsprim_TextOutW_22},
    {"c_PlgBlt", 11, hugsprim_PlgBlt_21},
    {"c_StretchBlt", 12, hugsprim_StretchBlt_20},
    {"c_MaskBlt", 13, hugsprim_MaskBlt_19},
    {"c_BitBlt", 10, hugsprim_BitBlt_18},
    {"c_Pie", 10, hugsprim_Pie_17},
    {"c_Chord", 10, hugsprim_Chord_16},
    {"c_Ellipse", 6, hugsprim_Ellipse_15},
    {"c_RoundRect", 8, hugsprim_RoundRect_14},
    {"c_Rectangle", 6, hugsprim_Rectangle_13},
    {"c_InvertRect", 3, hugsprim_InvertRect_12},
    {"c_FrameRect", 4, hugsprim_FrameRect_11},
    {"c_FillRect", 4, hugsprim_FillRect_10},
    {"c_AngleArc", 7, hugsprim_AngleArc_9},
    {"c_ArcTo", 10, hugsprim_ArcTo_8},
    {"c_Arc", 10, hugsprim_Arc_7},
    {"c_PolyBezierTo", 4, hugsprim_PolyBezierTo_6},
    {"c_PolyBezier", 4, hugsprim_PolyBezier_5},
    {"c_Polygon", 4, hugsprim_Polygon_4},
    {"c_PolylineTo", 4, hugsprim_PolylineTo_3},
    {"c_Polyline", 4, hugsprim_Polyline_2},
    {"c_LineTo", 4, hugsprim_LineTo_1},
    {"c_MoveToEx", 5, hugsprim_MoveToEx_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGGraphics2D
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

