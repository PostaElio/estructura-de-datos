/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPopClientAttrib
#endif

static void hugsprim_glPopClientAttrib_3(HugsStackPtr);
static void hugsprim_glPopClientAttrib_3(HugsStackPtr hugs_root)
{
    glPopClientAttrib();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPushClientAttrib
#endif

static void hugsprim_glPushClientAttrib_2(HugsStackPtr);
static void hugsprim_glPushClientAttrib_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glPushClientAttrib(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPopAttrib
#endif

static void hugsprim_glPopAttrib_1(HugsStackPtr);
static void hugsprim_glPopAttrib_1(HugsStackPtr hugs_root)
{
    glPopAttrib();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPushAttrib
#endif

static void hugsprim_glPushAttrib_0(HugsStackPtr);
static void hugsprim_glPushAttrib_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glPushAttrib(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glPopClientAttrib", 1, hugsprim_glPopClientAttrib_3},
    {"glPushClientAttrib", 2, hugsprim_glPushClientAttrib_2},
    {"glPopAttrib", 1, hugsprim_glPopAttrib_1},
    {"glPushAttrib", 2, hugsprim_glPushAttrib_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGSavingState
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

