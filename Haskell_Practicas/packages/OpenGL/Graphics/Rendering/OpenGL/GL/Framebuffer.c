/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glAccum
#endif

static void hugsprim_glAccum_11(HugsStackPtr);
static void hugsprim_glAccum_11(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsFloat arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    glAccum(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClearAccum
#endif

static void hugsprim_glClearAccum_10(HugsStackPtr);
static void hugsprim_glClearAccum_10(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsFloat arg4;
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getFloat();
    glClearAccum(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClearStencil
#endif

static void hugsprim_glClearStencil_9(HugsStackPtr);
static void hugsprim_glClearStencil_9(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    arg1 = hugs->getInt32();
    glClearStencil(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClearDepth
#endif

static void hugsprim_glClearDepth_8(HugsStackPtr);
static void hugsprim_glClearDepth_8(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    arg1 = hugs->getDouble();
    glClearDepth(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClearIndex
#endif

static void hugsprim_glClearIndex_7(HugsStackPtr);
static void hugsprim_glClearIndex_7(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    arg1 = hugs->getFloat();
    glClearIndex(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClearColor
#endif

static void hugsprim_glClearColor_6(HugsStackPtr);
static void hugsprim_glClearColor_6(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsFloat arg4;
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getFloat();
    glClearColor(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glClear
#endif

static void hugsprim_glClear_5(HugsStackPtr);
static void hugsprim_glClear_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glClear(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glStencilMask
#endif

static void hugsprim_glStencilMask_4(HugsStackPtr);
static void hugsprim_glStencilMask_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glStencilMask(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDepthMask
#endif

static void hugsprim_glDepthMask_3(HugsStackPtr);
static void hugsprim_glDepthMask_3(HugsStackPtr hugs_root)
{
    HsWord8 arg1;
    arg1 = hugs->getWord8();
    glDepthMask(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glColorMask
#endif

static void hugsprim_glColorMask_2(HugsStackPtr);
static void hugsprim_glColorMask_2(HugsStackPtr hugs_root)
{
    HsWord8 arg1;
    HsWord8 arg2;
    HsWord8 arg3;
    HsWord8 arg4;
    arg1 = hugs->getWord8();
    arg2 = hugs->getWord8();
    arg3 = hugs->getWord8();
    arg4 = hugs->getWord8();
    glColorMask(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glIndexMask
#endif

static void hugsprim_glIndexMask_1(HugsStackPtr);
static void hugsprim_glIndexMask_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glIndexMask(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDrawBuffer
#endif

static void hugsprim_glDrawBuffer_0(HugsStackPtr);
static void hugsprim_glDrawBuffer_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glDrawBuffer(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glAccum", 3, hugsprim_glAccum_11},
    {"glClearAccum", 5, hugsprim_glClearAccum_10},
    {"glClearStencil", 2, hugsprim_glClearStencil_9},
    {"glClearDepth", 2, hugsprim_glClearDepth_8},
    {"glClearIndex", 2, hugsprim_glClearIndex_7},
    {"glClearColor", 5, hugsprim_glClearColor_6},
    {"glClear", 2, hugsprim_glClear_5},
    {"glStencilMask", 2, hugsprim_glStencilMask_4},
    {"glDepthMask", 2, hugsprim_glDepthMask_3},
    {"glColorMask", 5, hugsprim_glColorMask_2},
    {"glIndexMask", 2, hugsprim_glIndexMask_1},
    {"glDrawBuffer", 2, hugsprim_glDrawBuffer_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGFramebuffer
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

