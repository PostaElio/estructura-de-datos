/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsGDI.h"
#include "HsWin32.h"
#include "WndProc.h"
#include <windows.h>

static HugsAPI5 *hugs = 0;
#include "windows.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef SendMessageW
#endif

static void hugsprim_SendMessageW_49(HugsStackPtr);
static void hugsprim_SendMessageW_49(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    res1 = SendMessageW(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DispatchMessageW
#endif

static void hugsprim_DispatchMessageW_48(HugsStackPtr);
static void hugsprim_DispatchMessageW_48(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = DispatchMessageW(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef UpdateWindow
#endif

static void hugsprim_UpdateWindow_47(HugsStackPtr);
static void hugsprim_UpdateWindow_47(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = UpdateWindow(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef TranslateMessage
#endif

static void hugsprim_TranslateMessage_46(HugsStackPtr);
static void hugsprim_TranslateMessage_46(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = TranslateMessage(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef PeekMessageW
#endif

static void hugsprim_PeekMessageW_45(HugsStackPtr);
static void hugsprim_PeekMessageW_45(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsWord32 arg5;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    arg5 = hugs->getWord32();
    res1 = PeekMessageW(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetMessageW
#endif

static void hugsprim_GetMessageW_44(HugsStackPtr);
static void hugsprim_GetMessageW_44(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsWord32 arg4;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getWord32();
    res1 = GetMessageW(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetCaretPos
#endif

static void hugsprim_SetCaretPos_43(HugsStackPtr);
static void hugsprim_SetCaretPos_43(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsBool res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = SetCaretPos(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetCaretPos
#endif

static void hugsprim_GetCaretPos_42(HugsStackPtr);
static void hugsprim_GetCaretPos_42(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = GetCaretPos(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DestroyCaret
#endif

static void hugsprim_DestroyCaret_41(HugsStackPtr);
static void hugsprim_DestroyCaret_41(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = DestroyCaret();
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateCaret
#endif

static void hugsprim_CreateCaret_40(HugsStackPtr);
static void hugsprim_CreateCaret_40(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    arg4 = hugs->getInt32();
    res1 = CreateCaret(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ShowCaret
#endif

static void hugsprim_ShowCaret_39(HugsStackPtr);
static void hugsprim_ShowCaret_39(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = ShowCaret(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef HideCaret
#endif

static void hugsprim_HideCaret_38(HugsStackPtr);
static void hugsprim_HideCaret_38(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = HideCaret(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDCOrgEx
#endif

static void hugsprim_GetDCOrgEx_37(HugsStackPtr);
static void hugsprim_GetDCOrgEx_37(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetDCOrgEx(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ReleaseDC
#endif

static void hugsprim_ReleaseDC_36(HugsStackPtr);
static void hugsprim_ReleaseDC_36(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = ReleaseDC(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetWindowDC
#endif

static void hugsprim_GetWindowDC_35(HugsStackPtr);
static void hugsprim_GetWindowDC_35(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetWindowDC(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDC
#endif

static void hugsprim_GetDC_34(HugsStackPtr);
static void hugsprim_GetDC_34(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetDC(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDCEx
#endif

static void hugsprim_GetDCEx_33(HugsStackPtr);
static void hugsprim_GetDCEx_33(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = GetDCEx(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetTopWindow
#endif

static void hugsprim_GetTopWindow_32(HugsStackPtr);
static void hugsprim_GetTopWindow_32(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetTopWindow(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetParent
#endif

static void hugsprim_GetParent_31(HugsStackPtr);
static void hugsprim_GetParent_31(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = GetParent(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetForegroundWindow
#endif

static void hugsprim_GetForegroundWindow_30(HugsStackPtr);
static void hugsprim_GetForegroundWindow_30(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetForegroundWindow();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDesktopWindow
#endif

static void hugsprim_GetDesktopWindow_29(HugsStackPtr);
static void hugsprim_GetDesktopWindow_29(HugsStackPtr hugs_root)
{
    HsPtr res1;
    res1 = GetDesktopWindow();
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MoveWindow
#endif

static void hugsprim_MoveWindow_28(HugsStackPtr);
static void hugsprim_MoveWindow_28(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt arg2;
    HsInt arg3;
    HsInt arg4;
    HsInt arg5;
    HsBool arg6;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt();
    arg3 = hugs->getInt();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    arg6 = hugs->getBool();
    res1 = MoveWindow(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FlashWindow
#endif

static void hugsprim_FlashWindow_27(HugsStackPtr);
static void hugsprim_FlashWindow_27(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    res1 = FlashWindow(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindWindowExW
#endif

static void hugsprim_FindWindowExW_26(HugsStackPtr);
static void hugsprim_FindWindowExW_26(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsPtr arg4;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getPtr();
    res1 = FindWindowExW(arg1, arg2, arg3, arg4);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindWindowW
#endif

static void hugsprim_FindWindowW_25(HugsStackPtr);
static void hugsprim_FindWindowW_25(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = FindWindowW(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EndDeferWindowPos
#endif

static void hugsprim_EndDeferWindowPos_24(HugsStackPtr);
static void hugsprim_EndDeferWindowPos_24(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = EndDeferWindowPos(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DestroyWindow
#endif

static void hugsprim_DestroyWindow_23(HugsStackPtr);
static void hugsprim_DestroyWindow_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DestroyWindow(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeferWindowPos
#endif

static void hugsprim_DeferWindowPos_22(HugsStackPtr);
static void hugsprim_DeferWindowPos_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt arg4;
    HsInt arg5;
    HsInt arg6;
    HsInt arg7;
    HsWord32 arg8;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getInt();
    arg5 = hugs->getInt();
    arg6 = hugs->getInt();
    arg7 = hugs->getInt();
    arg8 = hugs->getWord32();
    res1 = DeferWindowPos(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BringWindowToTop
#endif

static void hugsprim_BringWindowToTop_21(HugsStackPtr);
static void hugsprim_BringWindowToTop_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = BringWindowToTop(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BeginDeferWindowPos
#endif

static void hugsprim_BeginDeferWindowPos_20(HugsStackPtr);
static void hugsprim_BeginDeferWindowPos_20(HugsStackPtr hugs_root)
{
    HsInt arg1;
    HsPtr res1;
    arg1 = hugs->getInt();
    res1 = BeginDeferWindowPos(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ArrangeIconicWindows
#endif

static void hugsprim_ArrangeIconicWindows_19(HugsStackPtr);
static void hugsprim_ArrangeIconicWindows_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = ArrangeIconicWindows(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AnyPopup
#endif

static void hugsprim_AnyPopup_18(HugsStackPtr);
static void hugsprim_AnyPopup_18(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = AnyPopup();
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AdjustWindowRectEx
#endif

static void hugsprim_AdjustWindowRectEx_17(HugsStackPtr);
static void hugsprim_AdjustWindowRectEx_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsWord32 arg4;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    arg4 = hugs->getWord32();
    res1 = AdjustWindowRectEx(arg1, arg2, arg3, arg4);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AdjustWindowRect
#endif

static void hugsprim_AdjustWindowRect_16(HugsStackPtr);
static void hugsprim_AdjustWindowRect_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getBool();
    res1 = AdjustWindowRect(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ShowWindow
#endif

static void hugsprim_ShowWindow_15(HugsStackPtr);
static void hugsprim_ShowWindow_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = ShowWindow(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef EndPaint
#endif

static void hugsprim_EndPaint_14(HugsStackPtr);
static void hugsprim_EndPaint_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    EndPaint(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef BeginPaint
#endif

static void hugsprim_BeginPaint_13(HugsStackPtr);
static void hugsprim_BeginPaint_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = BeginPaint(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetWindowTextW
#endif

static void hugsprim_SetWindowTextW_12(HugsStackPtr);
static void hugsprim_SetWindowTextW_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SetWindowTextW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ClientToScreen
#endif

static void hugsprim_ClientToScreen_11(HugsStackPtr);
static void hugsprim_ClientToScreen_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = ClientToScreen(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ScreenToClient
#endif

static void hugsprim_ScreenToClient_10(HugsStackPtr);
static void hugsprim_ScreenToClient_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = ScreenToClient(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef InvalidateRect
#endif

static void hugsprim_InvalidateRect_9(HugsStackPtr);
static void hugsprim_InvalidateRect_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getBool();
    res1 = InvalidateRect(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetWindowRect
#endif

static void hugsprim_GetWindowRect_8(HugsStackPtr);
static void hugsprim_GetWindowRect_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetWindowRect(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetClientRect
#endif

static void hugsprim_GetClientRect_7(HugsStackPtr);
static void hugsprim_GetClientRect_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetClientRect(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DefWindowProcW
#endif

static void hugsprim_DefWindowProcW_6(HugsStackPtr);
static void hugsprim_DefWindowProcW_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    res1 = DefWindowProcW(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateWindowExW
#endif

static void hugsprim_CreateWindowExW_5(HugsStackPtr);
static void hugsprim_CreateWindowExW_5(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsWord32 arg4;
    HsInt arg5;
    HsInt arg6;
    HsInt arg7;
    HsInt arg8;
    HsPtr arg9;
    HsPtr arg10;
    HsPtr arg11;
    HsPtr arg12;
    HsPtr res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getWord32();
    arg5 = hugs->getInt();
    arg6 = hugs->getInt();
    arg7 = hugs->getInt();
    arg8 = hugs->getInt();
    arg9 = hugs->getPtr();
    arg10 = hugs->getPtr();
    arg11 = hugs->getPtr();
    arg12 = hugs->getPtr();
    res1 = CreateWindowExW(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetWindowLongW
#endif

static void hugsprim_SetWindowLongW_4(HugsStackPtr);
static void hugsprim_SetWindowLongW_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = SetWindowLongW(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

static HsInt32 v6898(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsWord32 arg2, HsWord32 arg3, HsInt32 arg4);
static HsInt32 v6898(HugsStablePtr fun1, void* unusedArg, HsPtr arg1, HsWord32 arg2, HsWord32 arg3, HsInt32 arg4)
{
    HsInt32 res1;
    hugs->derefStablePtr4(fun1);
    hugs->putPtr(arg1);
    hugs->putWord32(arg2);
    hugs->putWord32(arg3);
    hugs->putInt32(arg4);
    if (hugs->runIO(4)) {
        exit(hugs->getInt());
    }
    res1 = hugs->getInt32();
    return res1;
}

static void hugsprim_v6898_3(HugsStackPtr);
static void hugsprim_v6898_3(HugsStackPtr hugs_root)
{
    HugsStablePtr arg1 = hugs->makeStablePtr4();
    void* thunk = hugs->mkThunk((HsFunPtr)v6898,arg1);
    hugs->putAddr(thunk);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef UnregisterClassW
#endif

static void hugsprim_UnregisterClassW_2(HugsStackPtr);
static void hugsprim_UnregisterClassW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    UnregisterClassW(arg1, arg2);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef RegisterClassW
#endif

static void hugsprim_RegisterClassW_1(HugsStackPtr);
static void hugsprim_RegisterClassW_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = RegisterClassW(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}
#include "WndProc.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef genericWndProc
#endif

static void hugsprim_genericWndProc_0(HugsStackPtr);
static void hugsprim_genericWndProc_0(HugsStackPtr hugs_root)
{
    hugs->putFunPtr((HsFunPtr)&genericWndProc);
}

static struct hugs_primitive hugs_primTable[] = {
    {"sendMessage", 5, hugsprim_SendMessageW_49},
    {"dispatchMessage", 2, hugsprim_DispatchMessageW_48},
    {"c_UpdateWindow", 2, hugsprim_UpdateWindow_47},
    {"translateMessage", 2, hugsprim_TranslateMessage_46},
    {"c_PeekMessage", 6, hugsprim_PeekMessageW_45},
    {"c_GetMessage", 5, hugsprim_GetMessageW_44},
    {"c_SetCaretPos", 3, hugsprim_SetCaretPos_43},
    {"c_GetCaretPos", 2, hugsprim_GetCaretPos_42},
    {"c_DestroyCaret", 1, hugsprim_DestroyCaret_41},
    {"c_CreateCaret", 5, hugsprim_CreateCaret_40},
    {"c_ShowCaret", 2, hugsprim_ShowCaret_39},
    {"c_HideCaret", 2, hugsprim_HideCaret_38},
    {"c_GetDCOrgEx", 3, hugsprim_GetDCOrgEx_37},
    {"c_ReleaseDC", 3, hugsprim_ReleaseDC_36},
    {"c_GetWindowDC", 2, hugsprim_GetWindowDC_35},
    {"c_GetDC", 2, hugsprim_GetDC_34},
    {"c_GetDCEx", 4, hugsprim_GetDCEx_33},
    {"c_GetTopWindow", 2, hugsprim_GetTopWindow_32},
    {"c_GetParent", 2, hugsprim_GetParent_31},
    {"getForegroundWindow", 1, hugsprim_GetForegroundWindow_30},
    {"getDesktopWindow", 1, hugsprim_GetDesktopWindow_29},
    {"c_MoveWindow", 7, hugsprim_MoveWindow_28},
    {"flashWindow", 3, hugsprim_FlashWindow_27},
    {"c_FindWindowEx", 5, hugsprim_FindWindowExW_26},
    {"c_FindWindow", 3, hugsprim_FindWindowW_25},
    {"c_EndDeferWindowPos", 2, hugsprim_EndDeferWindowPos_24},
    {"c_DestroyWindow", 2, hugsprim_DestroyWindow_23},
    {"c_DeferWindowPos", 9, hugsprim_DeferWindowPos_22},
    {"c_BringWindowToTop", 2, hugsprim_BringWindowToTop_21},
    {"c_BeginDeferWindowPos", 2, hugsprim_BeginDeferWindowPos_20},
    {"c_ArrangeIconicWindows", 2, hugsprim_ArrangeIconicWindows_19},
    {"anyPopup", 1, hugsprim_AnyPopup_18},
    {"c_AdjustWindowRectEx", 5, hugsprim_AdjustWindowRectEx_17},
    {"c_AdjustWindowRect", 4, hugsprim_AdjustWindowRect_16},
    {"showWindow", 3, hugsprim_ShowWindow_15},
    {"endPaint", 3, hugsprim_EndPaint_14},
    {"c_BeginPaint", 3, hugsprim_BeginPaint_13},
    {"c_SetWindowText", 3, hugsprim_SetWindowTextW_12},
    {"c_ClientToScreen", 3, hugsprim_ClientToScreen_11},
    {"c_ScreenToClient", 3, hugsprim_ScreenToClient_10},
    {"c_InvalidateRect", 4, hugsprim_InvalidateRect_9},
    {"c_GetWindowRect", 3, hugsprim_GetWindowRect_8},
    {"c_GetClientRect", 3, hugsprim_GetClientRect_7},
    {"c_DefWindowProc", 5, hugsprim_DefWindowProcW_6},
    {"c_CreateWindowEx", 13, hugsprim_CreateWindowExW_5},
    {"c_SetWindowLong", 4, hugsprim_SetWindowLongW_4},
    {"mkWindowClosure", 2, hugsprim_v6898_3},
    {"unregisterClass", 3, hugsprim_UnregisterClassW_2},
    {"c_RegisterClass", 2, hugsprim_RegisterClassW_1},
    {"genericWndProc_p", 0, hugsprim_genericWndProc_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initGWWindow
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

