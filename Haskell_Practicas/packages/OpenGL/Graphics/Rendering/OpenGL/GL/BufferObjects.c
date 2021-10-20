/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

static void hugsprim_v7072_10(HugsStackPtr);
static void hugsprim_v7072_10(HugsStackPtr hugs_root)
{
    HsWord8 (*v7072)(HsWord32 arg1);
    HsWord32 arg1;
    HsWord8 res1;
    v7072 = (HsWord8 (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    res1 = v7072(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

static void hugsprim_v7073_9(HugsStackPtr);
static void hugsprim_v7073_9(HugsStackPtr hugs_root)
{
    HsPtr (*v7073)(HsWord32 arg1, HsWord32 arg2);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr res1;
    v7073 = (HsPtr (*)(HsWord32, HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    res1 = v7073(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static void hugsprim_v7074_8(HugsStackPtr);
static void hugsprim_v7074_8(HugsStackPtr hugs_root)
{
    void (*v7074)(HsWord32 arg1, HsWord32 arg2, HsPtr arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    v7074 = (void (*)(HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    v7074(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7075_7(HugsStackPtr);
static void hugsprim_v7075_7(HugsStackPtr hugs_root)
{
    void (*v7075)(HsWord32 arg1, HsWord32 arg2, HsPtr arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    v7075 = (void (*)(HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    v7075(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7076_6(HugsStackPtr);
static void hugsprim_v7076_6(HugsStackPtr hugs_root)
{
    void (*v7076)(HsWord32 arg1, HsInt32 arg2, HsInt32 arg3, HsPtr arg4);
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    v7076 = (void (*)(HsWord32, HsInt32, HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    v7076(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7077_5(HugsStackPtr);
static void hugsprim_v7077_5(HugsStackPtr hugs_root)
{
    void (*v7077)(HsWord32 arg1, HsInt32 arg2, HsInt32 arg3, HsPtr arg4);
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    v7077 = (void (*)(HsWord32, HsInt32, HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    v7077(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7078_4(HugsStackPtr);
static void hugsprim_v7078_4(HugsStackPtr hugs_root)
{
    void (*v7078)(HsWord32 arg1, HsInt32 arg2, HsPtr arg3, HsWord32 arg4);
    HsWord32 arg1;
    HsInt32 arg2;
    HsPtr arg3;
    HsWord32 arg4;
    v7078 = (void (*)(HsWord32, HsInt32, HsPtr, HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    arg4 = hugs->getWord32();
    v7078(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7079_3(HugsStackPtr);
static void hugsprim_v7079_3(HugsStackPtr hugs_root)
{
    void (*v7079)(HsWord32 arg1, HsWord32 arg2);
    HsWord32 arg1;
    HsWord32 arg2;
    v7079 = (void (*)(HsWord32, HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    v7079(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7080_2(HugsStackPtr);
static void hugsprim_v7080_2(HugsStackPtr hugs_root)
{
    HsWord8 (*v7080)(HsWord32 arg1);
    HsWord32 arg1;
    HsWord8 res1;
    v7080 = (HsWord8 (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    res1 = v7080(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

static void hugsprim_v7081_1(HugsStackPtr);
static void hugsprim_v7081_1(HugsStackPtr hugs_root)
{
    void (*v7081)(HsInt32 arg1, HsPtr arg2);
    HsInt32 arg1;
    HsPtr arg2;
    v7081 = (void (*)(HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    v7081(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7082_0(HugsStackPtr);
static void hugsprim_v7082_0(HugsStackPtr hugs_root)
{
    void (*v7082)(HsInt32 arg1, HsPtr arg2);
    HsInt32 arg1;
    HsPtr arg2;
    v7082 = (void (*)(HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    v7082(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"dyn_glUnmapBufferARB", 3, hugsprim_v7072_10},
    {"dyn_glMapBufferARB", 4, hugsprim_v7073_9},
    {"dyn_glGetBufferPointervARB", 5, hugsprim_v7074_8},
    {"dyn_glGetBufferParameterivARB", 5, hugsprim_v7075_7},
    {"dyn_glGetBufferSubDataARB", 6, hugsprim_v7076_6},
    {"dyn_glBufferSubDataARB", 6, hugsprim_v7077_5},
    {"dyn_glBufferDataARB", 6, hugsprim_v7078_4},
    {"dyn_glBindBufferARB", 4, hugsprim_v7079_3},
    {"dyn_glIsBufferARB", 3, hugsprim_v7080_2},
    {"dyn_glDeleteBuffersARB", 4, hugsprim_v7081_1},
    {"dyn_glGenBuffersARB", 4, hugsprim_v7082_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGBufferObjects
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

