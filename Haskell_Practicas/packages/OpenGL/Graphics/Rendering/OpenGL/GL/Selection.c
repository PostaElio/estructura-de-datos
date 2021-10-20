/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glLoadName
#endif

static void hugsprim_glLoadName_4(HugsStackPtr);
static void hugsprim_glLoadName_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glLoadName(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPushName
#endif

static void hugsprim_glPushName_3(HugsStackPtr);
static void hugsprim_glPushName_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glPushName(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPopName
#endif

static void hugsprim_glPopName_2(HugsStackPtr);
static void hugsprim_glPopName_2(HugsStackPtr hugs_root)
{
    glPopName();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glSelectBuffer
#endif

static void hugsprim_glSelectBuffer_1(HugsStackPtr);
static void hugsprim_glSelectBuffer_1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    glSelectBuffer(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glInitNames
#endif

static void hugsprim_glInitNames_0(HugsStackPtr);
static void hugsprim_glInitNames_0(HugsStackPtr hugs_root)
{
    glInitNames();
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"loadName", 2, hugsprim_glLoadName_4},
    {"glPushName", 2, hugsprim_glPushName_3},
    {"glPopName", 1, hugsprim_glPopName_2},
    {"glSelectBuffer", 3, hugsprim_glSelectBuffer_1},
    {"glInitNames", 1, hugsprim_glInitNames_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGSelection
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

