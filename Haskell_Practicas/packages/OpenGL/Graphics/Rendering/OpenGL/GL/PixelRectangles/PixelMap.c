/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPixelMapfv
#endif

static void hugsprim_glPixelMapfv_5(HugsStackPtr);
static void hugsprim_glPixelMapfv_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    glPixelMapfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetPixelMapfv
#endif

static void hugsprim_glGetPixelMapfv_4(HugsStackPtr);
static void hugsprim_glGetPixelMapfv_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetPixelMapfv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPixelMapuiv
#endif

static void hugsprim_glPixelMapuiv_3(HugsStackPtr);
static void hugsprim_glPixelMapuiv_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    glPixelMapuiv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetPixelMapuiv
#endif

static void hugsprim_glGetPixelMapuiv_2(HugsStackPtr);
static void hugsprim_glGetPixelMapuiv_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetPixelMapuiv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPixelMapusv
#endif

static void hugsprim_glPixelMapusv_1(HugsStackPtr);
static void hugsprim_glPixelMapusv_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    glPixelMapusv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetPixelMapusv
#endif

static void hugsprim_glGetPixelMapusv_0(HugsStackPtr);
static void hugsprim_glGetPixelMapusv_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetPixelMapusv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glPixelMapfv", 4, hugsprim_glPixelMapfv_5},
    {"glGetPixelMapfv", 3, hugsprim_glGetPixelMapfv_4},
    {"glPixelMapuiv", 4, hugsprim_glPixelMapuiv_3},
    {"glGetPixelMapuiv", 3, hugsprim_glGetPixelMapuiv_2},
    {"glPixelMapusv", 4, hugsprim_glPixelMapusv_1},
    {"glGetPixelMapusv", 3, hugsprim_glGetPixelMapusv_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPPixelMap
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

