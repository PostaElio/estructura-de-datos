/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glPolygonOffset
#endif

static void hugsprim_glPolygonOffset_4(HugsStackPtr);
static void hugsprim_glPolygonOffset_4(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    HsFloat arg2;
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    glPolygonOffset(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPolygonMode
#endif

static void hugsprim_glPolygonMode_3(HugsStackPtr);
static void hugsprim_glPolygonMode_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    glPolygonMode(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glPolygonStipple
#endif

static void hugsprim_glPolygonStipple_2(HugsStackPtr);
static void hugsprim_glPolygonStipple_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glPolygonStipple(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetPolygonStipple
#endif

static void hugsprim_glGetPolygonStipple_1(HugsStackPtr);
static void hugsprim_glGetPolygonStipple_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    glGetPolygonStipple(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glCullFace
#endif

static void hugsprim_glCullFace_0(HugsStackPtr);
static void hugsprim_glCullFace_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glCullFace(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glPolygonOffset", 3, hugsprim_glPolygonOffset_4},
    {"glPolygonMode", 3, hugsprim_glPolygonMode_3},
    {"glPolygonStipple", 2, hugsprim_glPolygonStipple_2},
    {"glGetPolygonStipple", 2, hugsprim_glGetPolygonStipple_1},
    {"glCullFace", 2, hugsprim_glCullFace_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPolygons
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

