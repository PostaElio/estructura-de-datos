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
#undef SetVolumeLabelW
#endif

static void hugsprim_SetVolumeLabelW_29(HugsStackPtr);
static void hugsprim_SetVolumeLabelW_29(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = SetVolumeLabelW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetDiskFreeSpaceW
#endif

static void hugsprim_GetDiskFreeSpaceW_28(HugsStackPtr);
static void hugsprim_GetDiskFreeSpaceW_28(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    res1 = GetDiskFreeSpaceW(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetLogicalDrives
#endif

static void hugsprim_GetLogicalDrives_27(HugsStackPtr);
static void hugsprim_GetLogicalDrives_27(HugsStackPtr hugs_root)
{
    HsWord32 res1;
    res1 = GetLogicalDrives();
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetHandleCount
#endif

static void hugsprim_SetHandleCount_26(HugsStackPtr);
static void hugsprim_SetHandleCount_26(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 res1;
    arg1 = hugs->getWord32();
    res1 = SetHandleCount(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetFileApisToANSI
#endif

static void hugsprim_SetFileApisToANSI_25(HugsStackPtr);
static void hugsprim_SetFileApisToANSI_25(HugsStackPtr hugs_root)
{
    SetFileApisToANSI();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetFileApisToOEM
#endif

static void hugsprim_SetFileApisToOEM_24(HugsStackPtr);
static void hugsprim_SetFileApisToOEM_24(HugsStackPtr hugs_root)
{
    SetFileApisToOEM();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef AreFileApisANSI
#endif

static void hugsprim_AreFileApisANSI_23(HugsStackPtr);
static void hugsprim_AreFileApisANSI_23(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = AreFileApisANSI();
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DefineDosDeviceW
#endif

static void hugsprim_DefineDosDeviceW_22(HugsStackPtr);
static void hugsprim_DefineDosDeviceW_22(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getWord32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = DefineDosDeviceW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindCloseChangeNotification
#endif

static void hugsprim_FindCloseChangeNotification_21(HugsStackPtr);
static void hugsprim_FindCloseChangeNotification_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FindCloseChangeNotification(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindNextChangeNotification
#endif

static void hugsprim_FindNextChangeNotification_20(HugsStackPtr);
static void hugsprim_FindNextChangeNotification_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FindNextChangeNotification(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FindFirstChangeNotificationW
#endif

static void hugsprim_FindFirstChangeNotificationW_19(HugsStackPtr);
static void hugsprim_FindFirstChangeNotificationW_19(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool arg2;
    HsWord32 arg3;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getBool();
    arg3 = hugs->getWord32();
    res1 = FindFirstChangeNotificationW(arg1, arg2, arg3);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef WriteFile
#endif

static void hugsprim_WriteFile_18(HugsStackPtr);
static void hugsprim_WriteFile_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    res1 = WriteFile(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ReadFile
#endif

static void hugsprim_ReadFile_17(HugsStackPtr);
static void hugsprim_ReadFile_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    res1 = ReadFile(arg1, arg2, arg3, arg4, arg5);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetFileInformationByHandle
#endif

static void hugsprim_GetFileInformationByHandle_16(HugsStackPtr);
static void hugsprim_GetFileInformationByHandle_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetFileInformationByHandle(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetFileAttributesW
#endif

static void hugsprim_GetFileAttributesW_15(HugsStackPtr);
static void hugsprim_GetFileAttributesW_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetFileAttributesW(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetFileAttributesW
#endif

static void hugsprim_SetFileAttributesW_14(HugsStackPtr);
static void hugsprim_SetFileAttributesW_14(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    res1 = SetFileAttributesW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetEndOfFile
#endif

static void hugsprim_SetEndOfFile_13(HugsStackPtr);
static void hugsprim_SetEndOfFile_13(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = SetEndOfFile(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef FlushFileBuffers
#endif

static void hugsprim_FlushFileBuffers_12(HugsStackPtr);
static void hugsprim_FlushFileBuffers_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = FlushFileBuffers(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetFileType
#endif

static void hugsprim_GetFileType_11(HugsStackPtr);
static void hugsprim_GetFileType_11(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = GetFileType(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CloseHandle
#endif

static void hugsprim_CloseHandle_10(HugsStackPtr);
static void hugsprim_CloseHandle_10(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = CloseHandle(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateFileW
#endif

static void hugsprim_CreateFileW_9(HugsStackPtr);
static void hugsprim_CreateFileW_9(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 arg2;
    HsWord32 arg3;
    HsPtr arg4;
    HsWord32 arg5;
    HsWord32 arg6;
    HsPtr arg7;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord32();
    arg3 = hugs->getWord32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getWord32();
    arg6 = hugs->getWord32();
    arg7 = hugs->getPtr();
    res1 = CreateFileW(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef GetBinaryTypeW
#endif

static void hugsprim_GetBinaryTypeW_8(HugsStackPtr);
static void hugsprim_GetBinaryTypeW_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = GetBinaryTypeW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef RemoveDirectoryW
#endif

static void hugsprim_RemoveDirectoryW_7(HugsStackPtr);
static void hugsprim_RemoveDirectoryW_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = RemoveDirectoryW(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDirectoryExW
#endif

static void hugsprim_CreateDirectoryExW_6(HugsStackPtr);
static void hugsprim_CreateDirectoryExW_6(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = CreateDirectoryExW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CreateDirectoryW
#endif

static void hugsprim_CreateDirectoryW_5(HugsStackPtr);
static void hugsprim_CreateDirectoryW_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = CreateDirectoryW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef SetCurrentDirectoryW
#endif

static void hugsprim_SetCurrentDirectoryW_4(HugsStackPtr);
static void hugsprim_SetCurrentDirectoryW_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = SetCurrentDirectoryW(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MoveFileExW
#endif

static void hugsprim_MoveFileExW_3(HugsStackPtr);
static void hugsprim_MoveFileExW_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = MoveFileExW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef MoveFileW
#endif

static void hugsprim_MoveFileW_2(HugsStackPtr);
static void hugsprim_MoveFileW_2(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = MoveFileW(arg1, arg2);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef CopyFileW
#endif

static void hugsprim_CopyFileW_1(HugsStackPtr);
static void hugsprim_CopyFileW_1(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsBool arg3;
    HsBool res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    arg3 = hugs->getBool();
    res1 = CopyFileW(arg1, arg2, arg3);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef DeleteFileW
#endif

static void hugsprim_DeleteFileW_0(HugsStackPtr);
static void hugsprim_DeleteFileW_0(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsBool res1;
    arg1 = hugs->getPtr();
    res1 = DeleteFileW(arg1);
    hugs->putBool(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_SetVolumeLabel", 3, hugsprim_SetVolumeLabelW_29},
    {"c_GetDiskFreeSpace", 6, hugsprim_GetDiskFreeSpaceW_28},
    {"c_GetLogicalDrives", 1, hugsprim_GetLogicalDrives_27},
    {"setHandleCount", 2, hugsprim_SetHandleCount_26},
    {"setFileApisToANSI", 1, hugsprim_SetFileApisToANSI_25},
    {"setFileApisToOEM", 1, hugsprim_SetFileApisToOEM_24},
    {"areFileApisANSI", 1, hugsprim_AreFileApisANSI_23},
    {"c_DefineDosDevice", 4, hugsprim_DefineDosDeviceW_22},
    {"c_FindCloseChangeNotification", 2, hugsprim_FindCloseChangeNotification_21},
    {"c_FindNextChangeNotification", 2, hugsprim_FindNextChangeNotification_20},
    {"c_FindFirstChangeNotification", 4, hugsprim_FindFirstChangeNotificationW_19},
    {"c_WriteFile", 6, hugsprim_WriteFile_18},
    {"c_ReadFile", 6, hugsprim_ReadFile_17},
    {"c_GetFileInformationByHandle", 3, hugsprim_GetFileInformationByHandle_16},
    {"c_GetFileAttributes", 2, hugsprim_GetFileAttributesW_15},
    {"c_SetFileAttributes", 3, hugsprim_SetFileAttributesW_14},
    {"c_SetEndOfFile", 2, hugsprim_SetEndOfFile_13},
    {"c_FlushFileBuffers", 2, hugsprim_FlushFileBuffers_12},
    {"getFileType", 2, hugsprim_GetFileType_11},
    {"c_CloseHandle", 2, hugsprim_CloseHandle_10},
    {"c_CreateFile", 8, hugsprim_CreateFileW_9},
    {"c_GetBinaryType", 3, hugsprim_GetBinaryTypeW_8},
    {"c_RemoveDirectory", 2, hugsprim_RemoveDirectoryW_7},
    {"c_CreateDirectoryEx", 4, hugsprim_CreateDirectoryExW_6},
    {"c_CreateDirectory", 3, hugsprim_CreateDirectoryW_5},
    {"c_SetCurrentDirectory", 2, hugsprim_SetCurrentDirectoryW_4},
    {"c_MoveFileEx", 4, hugsprim_MoveFileExW_3},
    {"c_MoveFile", 3, hugsprim_MoveFileW_2},
    {"c_CopyFile", 4, hugsprim_CopyFileW_1},
    {"c_DeleteFile", 2, hugsprim_DeleteFileW_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initSWFile
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

