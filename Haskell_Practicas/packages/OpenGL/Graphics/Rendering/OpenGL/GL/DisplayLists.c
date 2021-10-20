/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsOpenGL.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef glListBase
#endif

static void hugsprim_glListBase_7(HugsStackPtr);
static void hugsprim_glListBase_7(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glListBase(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glCallLists
#endif

static void hugsprim_glCallLists_6(HugsStackPtr);
static void hugsprim_glCallLists_6(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsWord32 arg2;
    HsPtr arg3;
    arg1 = hugs->getInt32();
    arg2 = hugs->getWord32();
    arg3 = hugs->getPtr();
    glCallLists(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glCallList
#endif

static void hugsprim_glCallList_5(HugsStackPtr);
static void hugsprim_glCallList_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    arg1 = hugs->getWord32();
    glCallList(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glEndList
#endif

static void hugsprim_glEndList_4(HugsStackPtr);
static void hugsprim_glEndList_4(HugsStackPtr hugs_root)
{
    glEndList();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glNewList
#endif

static void hugsprim_glNewList_3(HugsStackPtr);
static void hugsprim_glNewList_3(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getWord32();
    glNewList(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glIsList
#endif

static void hugsprim_glIsList_2(HugsStackPtr);
static void hugsprim_glIsList_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord8 res1;
    arg1 = hugs->getWord32();
    res1 = glIsList(arg1);
    hugs->putWord8(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glDeleteLists
#endif

static void hugsprim_glDeleteLists_1(HugsStackPtr);
static void hugsprim_glDeleteLists_1(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsInt32 arg2;
    arg1 = hugs->getWord32();
    arg2 = hugs->getInt32();
    glDeleteLists(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef glGenLists
#endif

static void hugsprim_glGenLists_0(HugsStackPtr);
static void hugsprim_glGenLists_0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsWord32 res1;
    arg1 = hugs->getInt32();
    res1 = glGenLists(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"glListBase", 2, hugsprim_glListBase_7},
    {"glCallLists", 4, hugsprim_glCallLists_6},
    {"callList", 2, hugsprim_glCallList_5},
    {"glEndList", 1, hugsprim_glEndList_4},
    {"glNewList", 3, hugsprim_glNewList_3},
    {"glIsList", 2, hugsprim_glIsList_2},
    {"glDeleteLists", 3, hugsprim_glDeleteLists_1},
    {"glGenLists", 2, hugsprim_glGenLists_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGROGDisplayLists
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

