/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glEdgeFlag
#endif

static void hugsprim_glEdgeFlag_3(HugsStackPtr);
static void hugsprim_glEdgeFlag_3(HugsStackPtr hugs_root)
{
    HsWord8 arg1;
    arg1 = hugs->getWord8();
    glEdgeFlag(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v6910_2(HugsStackPtr);
static void hugsprim_v6910_2(HugsStackPtr hugs_root)
{
    void (*v6910)();
    v6910 = (void (*)())hugs->getFunPtr();
    v6910();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEnd
#endif

static void hugsprim_glEnd_1(HugsStackPtr);
static void hugsprim_glEnd_1(HugsStackPtr hugs_root)
{
    glEnd();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glBegin
#endif

static void hugsprim_glBegin_0(HugsStackPtr);
static void hugsprim_glBegin_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glBegin(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glEdgeFlag", 2, hugsprim_glEdgeFlag_3},
    {"dyn_glPrimitiveRestartNV", 2, hugsprim_v6910_2},
    {"glEnd", 1, hugsprim_glEnd_1},
    {"glBegin", 2, hugsprim_glBegin_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGBeginEnd
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

