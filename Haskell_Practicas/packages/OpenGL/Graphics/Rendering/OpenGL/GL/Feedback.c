/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPassThrough
#endif

static void hugsprim_glPassThrough_1(HugsStackPtr);
static void hugsprim_glPassThrough_1(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    arg1 = hugs->getFloat();
    glPassThrough(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glFeedbackBuffer
#endif

static void hugsprim_glFeedbackBuffer_0(HugsStackPtr);
static void hugsprim_glFeedbackBuffer_0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getInt32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glFeedbackBuffer(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"passThrough", 2, hugsprim_glPassThrough_1},
    {"glFeedbackBuffer", 4, hugsprim_glFeedbackBuffer_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGFeedback
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

