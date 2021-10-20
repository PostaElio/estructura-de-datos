/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef WidenPath
#endif

static void hugsprim_WidenPath_8(HugsStackPtr);
static void hugsprim_WidenPath_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = WidenPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef StrokePath
#endif

static void hugsprim_StrokePath_7(HugsStackPtr);
static void hugsprim_StrokePath_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = StrokePath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef StrokeAndFillPath
#endif

static void hugsprim_StrokeAndFillPath_6(HugsStackPtr);
static void hugsprim_StrokeAndFillPath_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = StrokeAndFillPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PathToRegion
#endif

static void hugsprim_PathToRegion_5(HugsStackPtr);
static void hugsprim_PathToRegion_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = PathToRegion(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FlattenPath
#endif

static void hugsprim_FlattenPath_4(HugsStackPtr);
static void hugsprim_FlattenPath_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FlattenPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FillPath
#endif

static void hugsprim_FillPath_3(HugsStackPtr);
static void hugsprim_FillPath_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FillPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EndPath
#endif

static void hugsprim_EndPath_2(HugsStackPtr);
static void hugsprim_EndPath_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = EndPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CloseFigure
#endif

static void hugsprim_CloseFigure_1(HugsStackPtr);
static void hugsprim_CloseFigure_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = CloseFigure(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BeginPath
#endif

static void hugsprim_BeginPath_0(HugsStackPtr);
static void hugsprim_BeginPath_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = BeginPath(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_WidenPath", 2, hugsprim_WidenPath_8},
    {"c_StrokePath", 2, hugsprim_StrokePath_7},
    {"c_StrokeAndFillPath", 2, hugsprim_StrokeAndFillPath_6},
    {"c_PathToRegion", 2, hugsprim_PathToRegion_5},
    {"c_FlattenPath", 2, hugsprim_FlattenPath_4},
    {"c_FillPath", 2, hugsprim_FillPath_3},
    {"c_EndPath", 2, hugsprim_EndPath_2},
    {"c_CloseFigure", 2, hugsprim_CloseFigure_1},
    {"c_BeginPath", 2, hugsprim_BeginPath_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWGPath
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

