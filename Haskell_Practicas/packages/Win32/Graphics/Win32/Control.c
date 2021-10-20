/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"
#include <commctrl.h>
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef IsDlgButtonChecked
#endif

static void hugsprim_IsDlgButtonChecked_2(HugsStackPtr);
static void hugsprim_IsDlgButtonChecked_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    res1 = IsDlgButtonChecked(arg1, arg2);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CheckRadioButton
#endif

static void hugsprim_CheckRadioButton_1(HugsStackPtr);
static void hugsprim_CheckRadioButton_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt arg3;
    HsInt arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    res1 = CheckRadioButton(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CheckDlgButton
#endif

static void hugsprim_CheckDlgButton_0(HugsStackPtr);
static void hugsprim_CheckDlgButton_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsWord32 arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getWord32();
    res1 = CheckDlgButton(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_IsDlgButtonChecked", 3, hugsprim_IsDlgButtonChecked_2},
    {"c_CheckRadioButton", 5, hugsprim_CheckRadioButton_1},
    {"c_CheckDlgButton", 4, hugsprim_CheckDlgButton_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWControl
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

