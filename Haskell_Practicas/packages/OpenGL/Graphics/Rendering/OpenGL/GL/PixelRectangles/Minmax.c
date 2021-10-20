/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

static void hugsprim_v7987_3(HugsStackPtr);
static void hugsprim_v7987_3(HugsStackPtr hugs_root)
{
    void (*v7987)(HsWord32 arg1, HsWord32 arg2, HsPtr arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    v7987 = (void (*)(HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    v7987(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7988_2(HugsStackPtr);
static void hugsprim_v7988_2(HugsStackPtr hugs_root)
{
    void (*v7988)(HsWord32 arg1);
    HsWord32 arg1;
    v7988 = (void (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    v7988(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7989_1(HugsStackPtr);
static void hugsprim_v7989_1(HugsStackPtr hugs_root)
{
    void (*v7989)(HsWord32 arg1, HsWord8 arg2, HsWord32 arg3, HsWord32 arg4, HsPtr arg5);
    HsWord32 arg1;
    HsWord8 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsPtr arg5;
    v7989 = (void (*)(HsWord32, HsWord8, HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord8();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getPtr();
    v7989(arg1, arg2, arg3, arg4, arg5);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v7990_0(HugsStackPtr);
static void hugsprim_v7990_0(HugsStackPtr hugs_root)
{
    void (*v7990)(HsWord32 arg1, HsWord32 arg2, HsWord8 arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsWord8 arg3;
    v7990 = (void (*)(HsWord32, HsWord32, HsWord8))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord8();
    v7990(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"dyn_glGetMinmaxParameteriv", 5, hugsprim_v7987_3},
    {"dyn_glResetMinmax", 3, hugsprim_v7988_2},
    {"dyn_glGetMinmax", 7, hugsprim_v7989_1},
    {"dyn_glMinmax", 5, hugsprim_v7990_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPMinmax
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

