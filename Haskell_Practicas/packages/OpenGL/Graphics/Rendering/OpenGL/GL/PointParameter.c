/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

static void hugsprim_v6768_1(HugsStackPtr);
static void hugsprim_v6768_1(HugsStackPtr hugs_root)
{
    void (*v6768)(HsWord32 arg1, HsPtr arg2);
    HsWord32 arg1;
    HsPtr arg2;
    v6768 = (void (*)(HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    v6768(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v6769_0(HugsStackPtr);
static void hugsprim_v6769_0(HugsStackPtr hugs_root)
{
    void (*v6769)(HsWord32 arg1, HsFloat arg2);
    HsWord32 arg1;
    HsFloat arg2;
    v6769 = (void (*)(HsWord32, HsFloat))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    v6769(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"dyn_glPointParameterfvARB", 4, hugsprim_v6768_1},
    {"dyn_glPointParameterfARB", 4, hugsprim_v6769_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPointParameter
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

