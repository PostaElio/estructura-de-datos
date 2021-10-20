/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPixelTransferf
#endif

static void hugsprim_glPixelTransferf_1(HugsStackPtr);
static void hugsprim_glPixelTransferf_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsFloat arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    glPixelTransferf(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPixelTransferi
#endif

static void hugsprim_glPixelTransferi_0(HugsStackPtr);
static void hugsprim_glPixelTransferi_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    glPixelTransferi(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glPixelTransferf", 3, hugsprim_glPixelTransferf_1},
    {"glPixelTransferi", 3, hugsprim_glPixelTransferi_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPPixelTransfer
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

