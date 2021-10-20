/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"

static HugsAPI5 *hugs = 0;
#include "shlobj.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef SHGetFolderPathA
#endif

static void hugsprim_SHGetFolderPathA_0(HugsStackPtr);
static void hugsprim_SHGetFolderPathA_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsPtr arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    res1 = SHGetFolderPathA(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_SHGetFolderPath", 6, hugsprim_SHGetFolderPathA_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initDSLocalBuildInfo
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

