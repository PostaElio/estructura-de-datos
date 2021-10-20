/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glLogicOp
#endif

static void hugsprim_glLogicOp_19(HugsStackPtr);
static void hugsprim_glLogicOp_19(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glLogicOp(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8215_18(HugsStackPtr);
static void hugsprim_v8215_18(HugsStackPtr hugs_root)
{
    void (*v8215)(HsFloat arg1, HsFloat arg2, HsFloat arg3, HsFloat arg4);
    HsFloat arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsFloat arg4;
    v8215 = (void (*)(HsFloat, HsFloat, HsFloat, HsFloat))hugs->getFunPtr();
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getFloat();
    v8215(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glBlendFunc
#endif

static void hugsprim_glBlendFunc_17(HugsStackPtr);
static void hugsprim_glBlendFunc_17(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    glBlendFunc(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8216_16(HugsStackPtr);
static void hugsprim_v8216_16(HugsStackPtr hugs_root)
{
    void (*v8216)(HsWord32 arg1, HsWord32 arg2, HsWord32 arg3, HsWord32 arg4);
    HsWord32 arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    v8216 = (void (*)(HsWord32, HsWord32, HsWord32, HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    v8216(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8217_15(HugsStackPtr);
static void hugsprim_v8217_15(HugsStackPtr hugs_root)
{
    void (*v8217)(HsWord32 arg1);
    HsWord32 arg1;
    v8217 = (void (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    v8217(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8218_14(HugsStackPtr);
static void hugsprim_v8218_14(HugsStackPtr hugs_root)
{
    void (*v8218)(HsWord32 arg1, HsWord32 arg2, HsPtr arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    v8218 = (void (*)(HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    v8218(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8219_13(HugsStackPtr);
static void hugsprim_v8219_13(HugsStackPtr hugs_root)
{
    void (*v8219)(HsWord32 arg1, HsWord32 arg2, HsPtr arg3);
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    v8219 = (void (*)(HsWord32, HsWord32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    v8219(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8220_12(HugsStackPtr);
static void hugsprim_v8220_12(HugsStackPtr hugs_root)
{
    void (*v8220)(HsWord32 arg1);
    HsWord32 arg1;
    v8220 = (void (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    v8220(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8221_11(HugsStackPtr);
static void hugsprim_v8221_11(HugsStackPtr hugs_root)
{
    void (*v8221)(HsWord32 arg1, HsWord32 arg2);
    HsWord32 arg1;
    HsWord32 arg2;
    v8221 = (void (*)(HsWord32, HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    v8221(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8222_10(HugsStackPtr);
static void hugsprim_v8222_10(HugsStackPtr hugs_root)
{
    HsWord8 (*v8222)(HsWord32 arg1);
    HsWord32 arg1;
    HsWord8 res1;
    v8222 = (HsWord8 (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    res1 = v8222(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

static void hugsprim_v8223_9(HugsStackPtr);
static void hugsprim_v8223_9(HugsStackPtr hugs_root)
{
    void (*v8223)(HsInt32 arg1, HsPtr arg2);
    HsInt32 arg1;
    HsPtr arg2;
    v8223 = (void (*)(HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    v8223(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8224_8(HugsStackPtr);
static void hugsprim_v8224_8(HugsStackPtr hugs_root)
{
    void (*v8224)(HsInt32 arg1, HsPtr arg2);
    HsInt32 arg1;
    HsPtr arg2;
    v8224 = (void (*)(HsInt32, HsPtr))hugs->getFunPtr();
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    v8224(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDepthFunc
#endif

static void hugsprim_glDepthFunc_7(HugsStackPtr);
static void hugsprim_glDepthFunc_7(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glDepthFunc(arg1);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8225_6(HugsStackPtr);
static void hugsprim_v8225_6(HugsStackPtr hugs_root)
{
    void (*v8225)(HsWord32 arg1);
    HsWord32 arg1;
    v8225 = (void (*)(HsWord32))hugs->getFunPtr();
    arg1 = hugs->getWord32();
    v8225(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glStencilOp
#endif

static void hugsprim_glStencilOp_5(HugsStackPtr);
static void hugsprim_glStencilOp_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    glStencilOp(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glStencilFunc
#endif

static void hugsprim_glStencilFunc_4(HugsStackPtr);
static void hugsprim_glStencilFunc_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    HsWord32 arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getWord32();
    glStencilFunc(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glAlphaFunc
#endif

static void hugsprim_glAlphaFunc_3(HugsStackPtr);
static void hugsprim_glAlphaFunc_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsFloat arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getFloat();
    glAlphaFunc(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8226_2(HugsStackPtr);
static void hugsprim_v8226_2(HugsStackPtr hugs_root)
{
    void (*v8226)(HsDouble arg1, HsDouble arg2);
    HsDouble arg1;
    HsDouble arg2;
    v8226 = (void (*)(HsDouble, HsDouble))hugs->getFunPtr();
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    v8226(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

static void hugsprim_v8227_1(HugsStackPtr);
static void hugsprim_v8227_1(HugsStackPtr hugs_root)
{
    void (*v8227)(HsFloat arg1, HsWord8 arg2);
    HsFloat arg1;
    HsWord8 arg2;
    v8227 = (void (*)(HsFloat, HsWord8))hugs->getFunPtr();
    arg1 = hugs->getFloat();
    arg2 = hugs->getWord8();
    v8227(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glScissor
#endif

static void hugsprim_glScissor_0(HugsStackPtr);
static void hugsprim_glScissor_0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    glScissor(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glLogicOp", 2, hugsprim_glLogicOp_19},
    {"dyn_glBlendColorEXT", 6, hugsprim_v8215_18},
    {"glBlendFunc", 3, hugsprim_glBlendFunc_17},
    {"dyn_glBlendFuncSeparateEXT", 6, hugsprim_v8216_16},
    {"dyn_glBlendEquationEXT", 3, hugsprim_v8217_15},
    {"dyn_glGetQueryObjectuivARB", 5, hugsprim_v8218_14},
    {"dyn_glGetQueryivARB", 5, hugsprim_v8219_13},
    {"dyn_glEndQueryARB", 3, hugsprim_v8220_12},
    {"dyn_glBeginQueryARB", 4, hugsprim_v8221_11},
    {"dyn_glIsQueryARB", 3, hugsprim_v8222_10},
    {"dyn_glDeleteQueriesARB", 4, hugsprim_v8223_9},
    {"dyn_glGenQueriesARB", 4, hugsprim_v8224_8},
    {"glDepthFunc", 2, hugsprim_glDepthFunc_7},
    {"dyn_glActiveStencilFaceEXT", 3, hugsprim_v8225_6},
    {"glStencilOp", 4, hugsprim_glStencilOp_5},
    {"glStencilFunc", 4, hugsprim_glStencilFunc_4},
    {"glAlphaFunc", 3, hugsprim_glAlphaFunc_3},
    {"dyn_glDepthBoundsEXT", 4, hugsprim_v8226_2},
    {"dyn_glSampleCoverageARB", 4, hugsprim_v8227_1},
    {"glScissor", 5, hugsprim_glScissor_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGPerFragment
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

