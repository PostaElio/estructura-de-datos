/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexParameterfv
#endif

static void hugsprim_glGetTexParameterfv_5(HugsStackPtr);
static void hugsprim_glGetTexParameterfv_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexParameterfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexParameterfv
#endif

static void hugsprim_glGetTexParameterfv_4(HugsStackPtr);
static void hugsprim_glGetTexParameterfv_4(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexParameterfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGetTexParameteriv
#endif

static void hugsprim_glGetTexParameteriv_3(HugsStackPtr);
static void hugsprim_glGetTexParameteriv_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glGetTexParameteriv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexParameterfv
#endif

static void hugsprim_glTexParameterfv_2(HugsStackPtr);
static void hugsprim_glTexParameterfv_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glTexParameterfv(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexParameterf
#endif

static void hugsprim_glTexParameterf_1(HugsStackPtr);
static void hugsprim_glTexParameterf_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsFloat arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getFloat();
    glTexParameterf(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glTexParameteri
#endif

static void hugsprim_glTexParameteri_0(HugsStackPtr);
static void hugsprim_glTexParameteri_0(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    HsInt32 arg3;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getInt32();
    glTexParameteri(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glGetTexParameterC4f", 4, hugsprim_glGetTexParameterfv_5},
    {"glGetTexParameterfv", 4, hugsprim_glGetTexParameterfv_4},
    {"glGetTexParameteriv", 4, hugsprim_glGetTexParameteriv_3},
    {"glTexParameterC4f", 4, hugsprim_glTexParameterfv_2},
    {"glTexParameterf", 4, hugsprim_glTexParameterf_1},
    {"glTexParameteri", 4, hugsprim_glTexParameteri_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGTTexParameter
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

