/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetError
#endif

static void hugsprim_glGetError_1(HugsStackPtr);
static void hugsprim_glGetError_1(HugsStackPtr hugs_root)
{
    HsWord32 res1;
    res1 = glGetError();
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluErrorString
#endif

static void hugsprim_gluErrorString_0(HugsStackPtr);
static void hugsprim_gluErrorString_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr res1;
    arg1 = hugs->getWord32();
    res1 = gluErrorString(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glGetError", 1, hugsprim_glGetError_1},
    {"gluErrorString", 2, hugsprim_gluErrorString_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGErrorsInternal
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

