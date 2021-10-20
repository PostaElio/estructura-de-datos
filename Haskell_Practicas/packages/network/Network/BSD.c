/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsNet.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef gethostname
#endif

static void hugsprim_gethostname_6(HugsStackPtr);
static void hugsprim_gethostname_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = gethostname(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gethostbyaddr
#endif

static void hugsprim_gethostbyaddr_5(HugsStackPtr);
static void hugsprim_gethostbyaddr_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = gethostbyaddr(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef gethostbyname
#endif

static void hugsprim_gethostbyname_4(HugsStackPtr);
static void hugsprim_gethostbyname_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = gethostbyname(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getprotobynumber
#endif

static void hugsprim_getprotobynumber_3(HugsStackPtr);
static void hugsprim_getprotobynumber_3(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr res1;
    arg1 = hugs->getInt32();
    res1 = getprotobynumber(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getprotobyname
#endif

static void hugsprim_getprotobyname_2(HugsStackPtr);
static void hugsprim_getprotobyname_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = getprotobyname(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getservbyport
#endif

static void hugsprim_getservbyport_1(HugsStackPtr);
static void hugsprim_getservbyport_1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    res1 = getservbyport(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getservbyname
#endif

static void hugsprim_getservbyname_0(HugsStackPtr);
static void hugsprim_getservbyname_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = getservbyname(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_gethostname", 3, hugsprim_gethostname_6},
    {"c_gethostbyaddr", 4, hugsprim_gethostbyaddr_5},
    {"c_gethostbyname", 2, hugsprim_gethostbyname_4},
    {"c_getprotobynumber", 2, hugsprim_getprotobynumber_3},
    {"c_getprotobyname", 2, hugsprim_getprotobyname_2},
    {"c_getservbyport", 3, hugsprim_getservbyport_1},
    {"c_getservbyname", 3, hugsprim_getservbyname_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initNBSD
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

