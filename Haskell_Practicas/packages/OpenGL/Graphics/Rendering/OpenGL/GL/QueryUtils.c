/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetDoublev
#endif

static void hugsprim_glGetDoublev_3(HugsStackPtr);
static void hugsprim_glGetDoublev_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetDoublev(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetFloatv
#endif

static void hugsprim_glGetFloatv_2(HugsStackPtr);
static void hugsprim_glGetFloatv_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetFloatv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetIntegerv
#endif

static void hugsprim_glGetIntegerv_1(HugsStackPtr);
static void hugsprim_glGetIntegerv_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetIntegerv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetBooleanv
#endif

static void hugsprim_glGetBooleanv_0(HugsStackPtr);
static void hugsprim_glGetBooleanv_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    glGetBooleanv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glGetDoublev", 3, hugsprim_glGetDoublev_3},
    {"glGetFloatv", 3, hugsprim_glGetFloatv_2},
    {"glGetIntegerv", 3, hugsprim_glGetIntegerv_1},
    {"glGetBooleanv", 3, hugsprim_glGetBooleanv_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGQueryUtils
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

