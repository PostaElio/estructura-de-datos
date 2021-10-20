/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef DestroyIcon
#endif

static void hugsprim_DestroyIcon_2(HugsStackPtr);
static void hugsprim_DestroyIcon_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DestroyIcon(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DrawIcon
#endif

static void hugsprim_DrawIcon_1(HugsStackPtr);
static void hugsprim_DrawIcon_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt arg3;
    HsPtr arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    arg4 = hugs->getPtr();
    res1 = DrawIcon(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CopyIcon
#endif

static void hugsprim_CopyIcon_0(HugsStackPtr);
static void hugsprim_CopyIcon_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = CopyIcon(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_DestroyIcon", 2, hugsprim_DestroyIcon_2},
    {"c_DrawIcon", 5, hugsprim_DrawIcon_1},
    {"c_CopyIcon", 2, hugsprim_CopyIcon_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWIcon
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

