/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef gluBuild2DMipmaps
#endif

static void hugsprim_gluBuild2DMipmaps_2(HugsStackPtr);
static void hugsprim_gluBuild2DMipmaps_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsWord32 arg5;
    HsWord32 arg6;
    HsPtr arg7;
    HsInt32 res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getWord32();
    arg6 = hugs->getWord32();
    arg7 = hugs->getPtr();
    res1 = gluBuild2DMipmaps(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluBuild1DMipmaps
#endif

static void hugsprim_gluBuild1DMipmaps_1(HugsStackPtr);
static void hugsprim_gluBuild1DMipmaps_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsWord32 arg4;
    HsWord32 arg5;
    HsPtr arg6;
    HsInt32 res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getWord32();
    arg6 = hugs->getPtr();
    res1 = gluBuild1DMipmaps(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gluScaleImage
#endif

static void hugsprim_gluScaleImage_0(HugsStackPtr);
static void hugsprim_gluScaleImage_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsWord32 arg4;
    HsPtr arg5;
    HsInt32 arg6;
    HsInt32 arg7;
    HsWord32 arg8;
    HsPtr arg9;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getInt32();
    arg7 = hugs->getInt32();
    arg8 = hugs->getWord32();
    arg9 = hugs->getPtr();
    gluScaleImage(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"gluBuild2DMipmaps", 8, hugsprim_gluBuild2DMipmaps_2},
    {"gluBuild1DMipmaps", 7, hugsprim_gluBuild1DMipmaps_1},
    {"gluScaleImage", 10, hugsprim_gluScaleImage_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGMipmapping
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

