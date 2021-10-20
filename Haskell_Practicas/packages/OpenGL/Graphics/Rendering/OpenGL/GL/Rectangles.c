/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectdv
#endif

static void hugsprim_glRectdv_7(HugsStackPtr);
static void hugsprim_glRectdv_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    glRectdv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectd
#endif

static void hugsprim_glRectd_6(HugsStackPtr);
static void hugsprim_glRectd_6(HugsStackPtr hugs_root)
{
    HsDouble arg1;
    HsDouble arg2;
    HsDouble arg3;
    HsDouble arg4;
    arg1 = hugs->getDouble();
    arg2 = hugs->getDouble();
    arg3 = hugs->getDouble();
    arg4 = hugs->getDouble();
    glRectd(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectfv
#endif

static void hugsprim_glRectfv_5(HugsStackPtr);
static void hugsprim_glRectfv_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    glRectfv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectf
#endif

static void hugsprim_glRectf_4(HugsStackPtr);
static void hugsprim_glRectf_4(HugsStackPtr hugs_root)
{
    HsFloat arg1;
    HsFloat arg2;
    HsFloat arg3;
    HsFloat arg4;
    arg1 = hugs->getFloat();
    arg2 = hugs->getFloat();
    arg3 = hugs->getFloat();
    arg4 = hugs->getFloat();
    glRectf(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectiv
#endif

static void hugsprim_glRectiv_3(HugsStackPtr);
static void hugsprim_glRectiv_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    glRectiv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRecti
#endif

static void hugsprim_glRecti_2(HugsStackPtr);
static void hugsprim_glRecti_2(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    glRecti(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRectsv
#endif

static void hugsprim_glRectsv_1(HugsStackPtr);
static void hugsprim_glRectsv_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    glRectsv(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glRects
#endif

static void hugsprim_glRects_0(HugsStackPtr);
static void hugsprim_glRects_0(HugsStackPtr hugs_root)
{
    HsInt16 arg1;
    HsInt16 arg2;
    HsInt16 arg3;
    HsInt16 arg4;
    arg1 = hugs->getInt16();
    arg2 = hugs->getInt16();
    arg3 = hugs->getInt16();
    arg4 = hugs->getInt16();
    glRects(arg1, arg2, arg3, arg4);
    
    hugs->returnIO(hugs_root,0);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glRectdv", 3, hugsprim_glRectdv_7},
    {"glRectd", 5, hugsprim_glRectd_6},
    {"glRectfv", 3, hugsprim_glRectfv_5},
    {"glRectf", 5, hugsprim_glRectf_4},
    {"glRectiv", 3, hugsprim_glRectiv_3},
    {"glRecti", 5, hugsprim_glRecti_2},
    {"glRectsv", 3, hugsprim_glRectsv_1},
    {"glRects", 5, hugsprim_glRects_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGRectangles
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

