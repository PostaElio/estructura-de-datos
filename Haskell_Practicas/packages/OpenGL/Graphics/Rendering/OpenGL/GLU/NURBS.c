/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef gluLoadSamplingMatrices
#endif

static void hugsprim_gluLoadSamplingMatrices_24(HugsStackPtr);
static void hugsprim_gluLoadSamplingMatrices_24(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsPtr arg4;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getPtr();
    gluLoadSamplingMatrices(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsProperty
#endif

static void hugsprim_gluNurbsProperty_23(HugsStackPtr);
static void hugsprim_gluNurbsProperty_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFloat arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFloat();
    gluNurbsProperty(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluEndTrim
#endif

static void hugsprim_gluEndTrim_22(HugsStackPtr);
static void hugsprim_gluEndTrim_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluEndTrim(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluPwlCurve
#endif

static void hugsprim_gluPwlCurve_21(HugsStackPtr);
static void hugsprim_gluPwlCurve_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsWord32 arg5;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    arg5 = hugs->getWord32();
    gluPwlCurve(arg1, arg2, arg3, arg4, arg5);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluBeginTrim
#endif

static void hugsprim_gluBeginTrim_20(HugsStackPtr);
static void hugsprim_gluBeginTrim_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluBeginTrim(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluEndSurface
#endif

static void hugsprim_gluEndSurface_19(HugsStackPtr);
static void hugsprim_gluEndSurface_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluEndSurface(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsSurface
#endif

static void hugsprim_gluNurbsSurface_18(HugsStackPtr);
static void hugsprim_gluNurbsSurface_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsPtr arg8;
    HsInt32 arg9;
    HsInt32 arg10;
    HsWord32 arg11;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getPtr();
    arg9 = hugs->getInt32();
    arg10 = hugs->getInt32();
    arg11 = hugs->getWord32();
    gluNurbsSurface(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluBeginSurface
#endif

static void hugsprim_gluBeginSurface_17(HugsStackPtr);
static void hugsprim_gluBeginSurface_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluBeginSurface(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluEndCurve
#endif

static void hugsprim_gluEndCurve_16(HugsStackPtr);
static void hugsprim_gluEndCurve_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluEndCurve(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCurve
#endif

static void hugsprim_gluNurbsCurve_15(HugsStackPtr);
static void hugsprim_gluNurbsCurve_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsInt32 arg6;
    HsWord32 arg7;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getInt32();
    arg7 = hugs->getWord32();
    gluNurbsCurve(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluBeginCurve
#endif

static void hugsprim_gluBeginCurve_14(HugsStackPtr);
static void hugsprim_gluBeginCurve_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluBeginCurve(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_13(HugsStackPtr);
static void hugsprim_gluNurbsCallback_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7885(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1);
static void v7885(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord32(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7885_12(HugsStackPtr);
static void hugsprim_v7885_12(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7885,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_11(HugsStackPtr);
static void hugsprim_gluNurbsCallback_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7886(HugsStablePtr fun1, void* unusedArg);
static void v7886(HugsStablePtr fun1, void* unusedArg)
{
    hugs->derefStablePtr4(fun1);
    if (hugs->runIO(0)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7886_10(HugsStackPtr);
static void hugsprim_v7886_10(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7886,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_9(HugsStackPtr);
static void hugsprim_gluNurbsCallback_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7887(HugsStablePtr fun1, void* unusedArg, HsPtr arg1);
static void v7887(HugsStablePtr fun1, void* unusedArg, HsPtr arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7887_8(HugsStackPtr);
static void hugsprim_v7887_8(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7887,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_7(HugsStackPtr);
static void hugsprim_gluNurbsCallback_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7888(HugsStablePtr fun1, void* unusedArg, HsPtr arg1);
static void v7888(HugsStablePtr fun1, void* unusedArg, HsPtr arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7888_6(HugsStackPtr);
static void hugsprim_v7888_6(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7888,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_5(HugsStackPtr);
static void hugsprim_gluNurbsCallback_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7889(HugsStablePtr fun1, void* unusedArg, HsPtr arg1);
static void v7889(HugsStablePtr fun1, void* unusedArg, HsPtr arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7889_4(HugsStackPtr);
static void hugsprim_v7889_4(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7889,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNurbsCallback
#endif

static void hugsprim_gluNurbsCallback_3(HugsStackPtr);
static void hugsprim_gluNurbsCallback_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluNurbsCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7890(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1);
static void v7890(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord32(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7890_2(HugsStackPtr);
static void hugsprim_v7890_2(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7890,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluDeleteNurbsRenderer
#endif

static void hugsprim_gluDeleteNurbsRenderer_1(HugsStackPtr);
static void hugsprim_gluDeleteNurbsRenderer_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluDeleteNurbsRenderer(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNewNurbsRenderer
#endif

static void hugsprim_gluNewNurbsRenderer_0(HugsStackPtr);
static void hugsprim_gluNewNurbsRenderer_0(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = gluNewNurbsRenderer();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"gluLoadSamplingMatrices", 5, hugsprim_gluLoadSamplingMatrices_24},
    {"gluNurbsProperty", 4, hugsprim_gluNurbsProperty_23},
    {"gluEndTrim", 2, hugsprim_gluEndTrim_22},
    {"gluPwlCurve", 6, hugsprim_gluPwlCurve_21},
    {"gluBeginTrim", 2, hugsprim_gluBeginTrim_20},
    {"gluEndSurface", 2, hugsprim_gluEndSurface_19},
    {"gluNurbsSurface", 12, hugsprim_gluNurbsSurface_18},
    {"gluBeginSurface", 2, hugsprim_gluBeginSurface_17},
    {"gluEndCurve", 2, hugsprim_gluEndCurve_16},
    {"gluNurbsCurve", 8, hugsprim_gluNurbsCurve_15},
    {"gluBeginCurve", 2, hugsprim_gluBeginCurve_14},
    {"setErrorCallback", 4, hugsprim_gluNurbsCallback_13},
    {"makeErrorCallback", 2, hugsprim_v7885_12},
    {"setEndCallback", 4, hugsprim_gluNurbsCallback_11},
    {"makeEndCallback", 2, hugsprim_v7886_10},
    {"setColorCallback", 4, hugsprim_gluNurbsCallback_9},
    {"makeColorCallback", 2, hugsprim_v7887_8},
    {"setNormalCallback", 4, hugsprim_gluNurbsCallback_7},
    {"makeNormalCallback", 2, hugsprim_v7888_6},
    {"setVertexCallback", 4, hugsprim_gluNurbsCallback_5},
    {"makeVertexCallback", 2, hugsprim_v7889_4},
    {"setBeginCallback", 4, hugsprim_gluNurbsCallback_3},
    {"makeBeginCallback", 2, hugsprim_v7890_2},
    {"gluDeleteNurbsRenderer", 2, hugsprim_gluDeleteNurbsRenderer_1},
    {"gluNewNurbsRenderer", 1, hugsprim_gluNewNurbsRenderer_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGNURBS
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

