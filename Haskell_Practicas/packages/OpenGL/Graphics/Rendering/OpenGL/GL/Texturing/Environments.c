/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexEnvfv
#endif

static void hugsprim_glGetTexEnvfv_5(HugsStackPtr);
static void hugsprim_glGetTexEnvfv_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexEnvfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexEnvfv
#endif

static void hugsprim_glGetTexEnvfv_4(HugsStackPtr);
static void hugsprim_glGetTexEnvfv_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexEnvfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexEnviv
#endif

static void hugsprim_glGetTexEnviv_3(HugsStackPtr);
static void hugsprim_glGetTexEnviv_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexEnviv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexEnvfv
#endif

static void hugsprim_glTexEnvfv_2(HugsStackPtr);
static void hugsprim_glTexEnvfv_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glTexEnvfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexEnvf
#endif

static void hugsprim_glTexEnvf_1(HugsStackPtr);
static void hugsprim_glTexEnvf_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsFloat arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFloat();
    glTexEnvf(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexEnvi
#endif

static void hugsprim_glTexEnvi_0(HugsStackPtr);
static void hugsprim_glTexEnvi_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsInt32 arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getInt32();
    glTexEnvi(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glGetTexEnvC4f", 4, hugsprim_glGetTexEnvfv_5},
    {"glGetTexEnvfv", 4, hugsprim_glGetTexEnvfv_4},
    {"glGetTexEnviv", 4, hugsprim_glGetTexEnviv_3},
    {"glTexEnvC4f", 4, hugsprim_glTexEnvfv_2},
    {"glTexEnvf", 4, hugsprim_glTexEnvf_1},
    {"glTexEnvi", 4, hugsprim_glTexEnvi_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGTEnvironments
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

