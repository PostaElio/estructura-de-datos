/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPrioritizeTextures
#endif

static void hugsprim_glPrioritizeTextures_5(HugsStackPtr);
static void hugsprim_glPrioritizeTextures_5(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    glPrioritizeTextures(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glAreTexturesResident
#endif

static void hugsprim_glAreTexturesResident_4(HugsStackPtr);
static void hugsprim_glAreTexturesResident_4(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord8 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = glAreTexturesResident(arg1, arg2, arg3);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glBindTexture
#endif

static void hugsprim_glBindTexture_3(HugsStackPtr);
static void hugsprim_glBindTexture_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    glBindTexture(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glIsTexture
#endif

static void hugsprim_glIsTexture_2(HugsStackPtr);
static void hugsprim_glIsTexture_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = glIsTexture(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDeleteTextures
#endif

static void hugsprim_glDeleteTextures_1(HugsStackPtr);
static void hugsprim_glDeleteTextures_1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    glDeleteTextures(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGenTextures
#endif

static void hugsprim_glGenTextures_0(HugsStackPtr);
static void hugsprim_glGenTextures_0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    glGenTextures(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glPrioritizeTextures", 4, hugsprim_glPrioritizeTextures_5},
    {"glAreTexturesResident", 4, hugsprim_glAreTexturesResident_4},
    {"glBindTexture", 3, hugsprim_glBindTexture_3},
    {"glIsTexture", 2, hugsprim_glIsTexture_2},
    {"glDeleteTextures", 3, hugsprim_glDeleteTextures_1},
    {"glGenTextures", 3, hugsprim_glGenTextures_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGTObjects
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

