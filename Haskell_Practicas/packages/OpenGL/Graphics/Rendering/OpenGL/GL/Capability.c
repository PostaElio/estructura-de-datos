/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glEnable
#endif

static void hugsprim_glEnable_2(HugsStackPtr);
static void hugsprim_glEnable_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glEnable(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDisable
#endif

static void hugsprim_glDisable_1(HugsStackPtr);
static void hugsprim_glDisable_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glDisable(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glIsEnabled
#endif

static void hugsprim_glIsEnabled_0(HugsStackPtr);
static void hugsprim_glIsEnabled_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = glIsEnabled(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glEnable", 2, hugsprim_glEnable_2},
    {"glDisable", 2, hugsprim_glDisable_1},
    {"glIsEnabled", 2, hugsprim_glIsEnabled_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGCapability
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

