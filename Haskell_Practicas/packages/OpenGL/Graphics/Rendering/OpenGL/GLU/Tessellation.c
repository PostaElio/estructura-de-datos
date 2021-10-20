/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessNormal
#endif

static void hugsprim_gluTessNormal_20(HugsStackPtr);
static void hugsprim_gluTessNormal_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    arg1 = hugs->getPtr();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    gluTessNormal(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessProperty
#endif

static void hugsprim_gluTessProperty_19(HugsStackPtr);
static void hugsprim_gluTessProperty_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsDouble arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getDouble();
    gluTessProperty(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_18(HugsStackPtr);
static void hugsprim_gluTessCallback_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7635(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsPtr arg2, HsPtr arg3, HsPtr arg4);
static void v7635(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsPtr arg2, HsPtr arg3, HsPtr arg4)
{
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    hugs->putPtr(arg2);
    hugs->putPtr(arg3);
    hugs->putPtr(arg4);
    if (hugs->runIO(4)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7635_17(HugsStackPtr);
static void hugsprim_v7635_17(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7635,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_16(HugsStackPtr);
static void hugsprim_gluTessCallback_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7636(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1);
static void v7636(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord32(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7636_15(HugsStackPtr);
static void hugsprim_v7636_15(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7636,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_14(HugsStackPtr);
static void hugsprim_gluTessCallback_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7637(HugsStablePtr fun1, void* unusedArg);
static void v7637(HugsStablePtr fun1, void* unusedArg)
{
    hugs->derefStablePtr4(fun1);
    if (hugs->runIO(0)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7637_13(HugsStackPtr);
static void hugsprim_v7637_13(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7637,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_12(HugsStackPtr);
static void hugsprim_gluTessCallback_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7638(HugsStablePtr fun1, void* unusedArg, HsPtr arg1);
static void v7638(HugsStablePtr fun1, void* unusedArg, HsPtr arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7638_11(HugsStackPtr);
static void hugsprim_v7638_11(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7638,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_10(HugsStackPtr);
static void hugsprim_gluTessCallback_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7639(HugsStablePtr fun1, void* unusedArg, HsWord8 arg1);
static void v7639(HugsStablePtr fun1, void* unusedArg, HsWord8 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord8(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7639_9(HugsStackPtr);
static void hugsprim_v7639_9(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7639,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessCallback
#endif

static void hugsprim_gluTessCallback_8(HugsStackPtr);
static void hugsprim_gluTessCallback_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsFunPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFunPtr();
    gluTessCallback(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void v7640(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1);
static void v7640(HugsStablePtr fun1, void* unusedArg, HsWord32 arg1)
{
    hugs->derefStablePtr4(fun1);
    hugs->putWord32(arg1);
    if (hugs->runIO(1)) {
        exit(hugs->getInt());
    }
    hugs->getUnit();
    return;
}

static void hugsprim_v7640_7(HugsStackPtr);
static void hugsprim_v7640_7(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v7640,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessVertex
#endif

static void hugsprim_gluTessVertex_6(HugsStackPtr);
static void hugsprim_gluTessVertex_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    gluTessVertex(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessEndContour
#endif

static void hugsprim_gluTessEndContour_5(HugsStackPtr);
static void hugsprim_gluTessEndContour_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluTessEndContour(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessBeginContour
#endif

static void hugsprim_gluTessBeginContour_4(HugsStackPtr);
static void hugsprim_gluTessBeginContour_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluTessBeginContour(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessEndPolygon
#endif

static void hugsprim_gluTessEndPolygon_3(HugsStackPtr);
static void hugsprim_gluTessEndPolygon_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluTessEndPolygon(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluTessBeginPolygon
#endif

static void hugsprim_gluTessBeginPolygon_2(HugsStackPtr);
static void hugsprim_gluTessBeginPolygon_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    gluTessBeginPolygon(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluDeleteTess
#endif

static void hugsprim_gluDeleteTess_1(HugsStackPtr);
static void hugsprim_gluDeleteTess_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    gluDeleteTess(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluNewTess
#endif

static void hugsprim_gluNewTess_0(HugsStackPtr);
static void hugsprim_gluNewTess_0(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = gluNewTess();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"gluTessNormal", 5, hugsprim_gluTessNormal_20},
    {"gluTessProperty", 4, hugsprim_gluTessProperty_19},
    {"setCombineCallback", 4, hugsprim_gluTessCallback_18},
    {"makeCombineCallback", 2, hugsprim_v7635_17},
    {"setErrorCallback", 4, hugsprim_gluTessCallback_16},
    {"makeErrorCallback", 2, hugsprim_v7636_15},
    {"setEndCallback", 4, hugsprim_gluTessCallback_14},
    {"makeEndCallback", 2, hugsprim_v7637_13},
    {"setVertexCallback", 4, hugsprim_gluTessCallback_12},
    {"makeVertexCallback", 2, hugsprim_v7638_11},
    {"setEdgeFlagCallback", 4, hugsprim_gluTessCallback_10},
    {"makeEdgeFlagCallback", 2, hugsprim_v7639_9},
    {"setBeginCallback", 4, hugsprim_gluTessCallback_8},
    {"makeBeginCallback", 2, hugsprim_v7640_7},
    {"gluTessVertex", 4, hugsprim_gluTessVertex_6},
    {"gluTessEndContour", 2, hugsprim_gluTessEndContour_5},
    {"gluTessBeginContour", 2, hugsprim_gluTessBeginContour_4},
    {"gluTessEndPolygon", 2, hugsprim_gluTessEndPolygon_3},
    {"gluTessBeginPolygon", 3, hugsprim_gluTessBeginPolygon_2},
    {"gluDeleteTess", 2, hugsprim_gluDeleteTess_1},
    {"gluNewTess", 1, hugsprim_gluNewTess_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGTessellation
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

