/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsBase.h"

static HugsAPI5 *hugs = 0;
#include "HsBase.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_f_setfl
#endif

static void hugsprim___hscore_f_setfl_62(HugsStackPtr);
static void hugsprim___hscore_f_setfl_62(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_f_setfl();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_f_getfl
#endif

static void hugsprim___hscore_f_getfl_61(HugsStackPtr);
static void hugsprim___hscore_f_getfl_61(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_f_getfl();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_sig_setmask
#endif

static void hugsprim___hscore_sig_setmask_60(HugsStackPtr);
static void hugsprim___hscore_sig_setmask_60(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_sig_setmask();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_sig_block
#endif

static void hugsprim___hscore_sig_block_59(HugsStackPtr);
static void hugsprim___hscore_sig_block_59(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_sig_block();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_sigttou
#endif

static void hugsprim___hscore_sigttou_58(HugsStackPtr);
static void hugsprim___hscore_sigttou_58(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_sigttou();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_vtime
#endif

static void hugsprim___hscore_vtime_57(HugsStackPtr);
static void hugsprim___hscore_vtime_57(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_vtime();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_vmin
#endif

static void hugsprim___hscore_vmin_56(HugsStackPtr);
static void hugsprim___hscore_vmin_56(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_vmin();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_icanon
#endif

static void hugsprim___hscore_icanon_55(HugsStackPtr);
static void hugsprim___hscore_icanon_55(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_icanon();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_tcsanow
#endif

static void hugsprim___hscore_tcsanow_54(HugsStackPtr);
static void hugsprim___hscore_tcsanow_54(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_tcsanow();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_echo
#endif

static void hugsprim___hscore_echo_53(HugsStackPtr);
static void hugsprim___hscore_echo_53(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_echo();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_st_mode
#endif

static void hugsprim___hscore_st_mode_52(HugsStackPtr);
static void hugsprim___hscore_st_mode_52(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord16 res1;
    arg1 = hugs->getPtr();
    res1 = __hscore_st_mode(arg1);
    hugs->putWord16(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_st_size
#endif

static void hugsprim___hscore_st_size_51(HugsStackPtr);
static void hugsprim___hscore_st_size_51(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = __hscore_st_size(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_st_mtime
#endif

static void hugsprim___hscore_st_mtime_50(HugsStackPtr);
static void hugsprim___hscore_st_mtime_50(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = __hscore_st_mtime(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_sizeof_stat
#endif

static void hugsprim___hscore_sizeof_stat_49(HugsStackPtr);
static void hugsprim___hscore_sizeof_stat_49(HugsStackPtr hugs_root)
{
    HsInt res1;
    res1 = __hscore_sizeof_stat();
    hugs->putInt(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_s_isfifo
#endif

static void hugsprim___hscore_s_isfifo_48(HugsStackPtr);
static void hugsprim___hscore_s_isfifo_48(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsBool res1;
    arg1 = hugs->getWord16();
    res1 = __hscore_s_isfifo(arg1);
    hugs->putBool(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_s_isdir
#endif

static void hugsprim___hscore_s_isdir_47(HugsStackPtr);
static void hugsprim___hscore_s_isdir_47(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsBool res1;
    arg1 = hugs->getWord16();
    res1 = __hscore_s_isdir(arg1);
    hugs->putBool(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_s_isblk
#endif

static void hugsprim___hscore_s_isblk_46(HugsStackPtr);
static void hugsprim___hscore_s_isblk_46(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsBool res1;
    arg1 = hugs->getWord16();
    res1 = __hscore_s_isblk(arg1);
    hugs->putBool(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_s_ischr
#endif

static void hugsprim___hscore_s_ischr_45(HugsStackPtr);
static void hugsprim___hscore_s_ischr_45(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsBool res1;
    arg1 = hugs->getWord16();
    res1 = __hscore_s_ischr(arg1);
    hugs->putBool(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_s_isreg
#endif

static void hugsprim___hscore_s_isreg_44(HugsStackPtr);
static void hugsprim___hscore_s_isreg_44(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsBool res1;
    arg1 = hugs->getWord16();
    res1 = __hscore_s_isreg(arg1);
    hugs->putBool(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_binary
#endif

static void hugsprim___hscore_o_binary_43(HugsStackPtr);
static void hugsprim___hscore_o_binary_43(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_binary();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_nonblock
#endif

static void hugsprim___hscore_o_nonblock_42(HugsStackPtr);
static void hugsprim___hscore_o_nonblock_42(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_nonblock();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_noctty
#endif

static void hugsprim___hscore_o_noctty_41(HugsStackPtr);
static void hugsprim___hscore_o_noctty_41(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_noctty();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_trunc
#endif

static void hugsprim___hscore_o_trunc_40(HugsStackPtr);
static void hugsprim___hscore_o_trunc_40(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_trunc();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_excl
#endif

static void hugsprim___hscore_o_excl_39(HugsStackPtr);
static void hugsprim___hscore_o_excl_39(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_excl();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_creat
#endif

static void hugsprim___hscore_o_creat_38(HugsStackPtr);
static void hugsprim___hscore_o_creat_38(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_creat();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_append
#endif

static void hugsprim___hscore_o_append_37(HugsStackPtr);
static void hugsprim___hscore_o_append_37(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_append();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_rdwr
#endif

static void hugsprim___hscore_o_rdwr_36(HugsStackPtr);
static void hugsprim___hscore_o_rdwr_36(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_rdwr();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_wronly
#endif

static void hugsprim___hscore_o_wronly_35(HugsStackPtr);
static void hugsprim___hscore_o_wronly_35(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_wronly();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_o_rdonly
#endif

static void hugsprim___hscore_o_rdonly_34(HugsStackPtr);
static void hugsprim___hscore_o_rdonly_34(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_o_rdonly();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_d_name
#endif

static void hugsprim___hscore_d_name_33(HugsStackPtr);
static void hugsprim___hscore_d_name_33(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = __hscore_d_name(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_end_of_dir
#endif

static void hugsprim___hscore_end_of_dir_32(HugsStackPtr);
static void hugsprim___hscore_end_of_dir_32(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = __hscore_end_of_dir();
    hugs->putInt32(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_free_dirent
#endif

static void hugsprim___hscore_free_dirent_31(HugsStackPtr);
static void hugsprim___hscore_free_dirent_31(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    __hscore_free_dirent(arg1);
    
    hugs->returnIO(hugs_root,0);
}
#include "dirUtils.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_readdir
#endif

static void hugsprim___hscore_readdir_30(HugsStackPtr);
static void hugsprim___hscore_readdir_30(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = __hscore_readdir(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef _setmode
#endif

static void hugsprim__setmode_29(HugsStackPtr);
static void hugsprim__setmode_29(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = _setmode(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getpid
#endif

static void hugsprim_getpid_28(HugsStackPtr);
static void hugsprim_getpid_28(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = getpid();
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef unlink
#endif

static void hugsprim_unlink_27(HugsStackPtr);
static void hugsprim_unlink_27(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = unlink(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_ftruncate
#endif

static void hugsprim___hscore_ftruncate_26(HugsStackPtr);
static void hugsprim___hscore_ftruncate_26(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = __hscore_ftruncate(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef write
#endif

static void hugsprim_write_25(HugsStackPtr);
static void hugsprim_write_25(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = write(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef umask
#endif

static void hugsprim_umask_24(HugsStackPtr);
static void hugsprim_umask_24(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsWord16 res1;
    arg1 = hugs->getWord16();
    res1 = umask(arg1);
    hugs->putWord16(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_stat
#endif

static void hugsprim___hscore_stat_23(HugsStackPtr);
static void hugsprim___hscore_stat_23(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = __hscore_stat(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef rmdir
#endif

static void hugsprim_rmdir_22(HugsStackPtr);
static void hugsprim_rmdir_22(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = rmdir(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef rewinddir
#endif

static void hugsprim_rewinddir_21(HugsStackPtr);
static void hugsprim_rewinddir_21(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    arg1 = hugs->getPtr();
    rewinddir(arg1);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_renameFile
#endif

static void hugsprim___hscore_renameFile_20(HugsStackPtr);
static void hugsprim___hscore_renameFile_20(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = __hscore_renameFile(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef read
#endif

static void hugsprim_read_19(HugsStackPtr);
static void hugsprim_read_19(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    res1 = read(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_mkdir
#endif

static void hugsprim___hscore_mkdir_18(HugsStackPtr);
static void hugsprim___hscore_mkdir_18(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = __hscore_mkdir(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef opendir
#endif

static void hugsprim_opendir_17(HugsStackPtr);
static void hugsprim_opendir_17(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr res1;
    arg1 = hugs->getPtr();
    res1 = opendir(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_open
#endif

static void hugsprim___hscore_open_16(HugsStackPtr);
static void hugsprim___hscore_open_16(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsWord16 arg3;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getWord16();
    res1 = __hscore_open(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_lstat
#endif

static void hugsprim___hscore_lstat_15(HugsStackPtr);
static void hugsprim___hscore_lstat_15(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getPtr();
    res1 = __hscore_lstat(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_lseek
#endif

static void hugsprim___hscore_lseek_14(HugsStackPtr);
static void hugsprim___hscore_lseek_14(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = __hscore_lseek(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef isatty
#endif

static void hugsprim_isatty_13(HugsStackPtr);
static void hugsprim_isatty_13(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    res1 = isatty(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getcwd
#endif

static void hugsprim_getcwd_12(HugsStackPtr);
static void hugsprim_getcwd_12(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsPtr res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    res1 = getcwd(arg1, arg2);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef __hscore_fstat
#endif

static void hugsprim___hscore_fstat_11(HugsStackPtr);
static void hugsprim___hscore_fstat_11(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    res1 = __hscore_fstat(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef dup2
#endif

static void hugsprim_dup2_10(HugsStackPtr);
static void hugsprim_dup2_10(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = dup2(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef dup
#endif

static void hugsprim_dup_9(HugsStackPtr);
static void hugsprim_dup_9(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    res1 = dup(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef creat
#endif

static void hugsprim_creat_8(HugsStackPtr);
static void hugsprim_creat_8(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord16 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord16();
    res1 = creat(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef closedir
#endif

static void hugsprim_closedir_7(HugsStackPtr);
static void hugsprim_closedir_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = closedir(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef close
#endif

static void hugsprim_close_6(HugsStackPtr);
static void hugsprim_close_6(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    res1 = close(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef chdir
#endif

static void hugsprim_chdir_5(HugsStackPtr);
static void hugsprim_chdir_5(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    res1 = chdir(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef chmod
#endif

static void hugsprim_chmod_4(HugsStackPtr);
static void hugsprim_chmod_4(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord16 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord16();
    res1 = chmod(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef access
#endif

static void hugsprim_access_3(HugsStackPtr);
static void hugsprim_access_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord16 arg2;
    HsInt32 res1;
    arg1 = hugs->getPtr();
    arg2 = hugs->getWord16();
    res1 = access(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}
#include "consUtils.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef get_console_echo__
#endif

static void hugsprim_get_console_echo___2(HugsStackPtr);
static void hugsprim_get_console_echo___2(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    res1 = get_console_echo__(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef set_console_echo__
#endif

static void hugsprim_set_console_echo___1(HugsStackPtr);
static void hugsprim_set_console_echo___1(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = set_console_echo__(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef set_console_buffering__
#endif

static void hugsprim_set_console_buffering___0(HugsStackPtr);
static void hugsprim_set_console_buffering___0(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = set_console_buffering__(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"const_f_setfl", 0, hugsprim___hscore_f_setfl_62},
    {"const_f_getfl", 0, hugsprim___hscore_f_getfl_61},
    {"const_sig_setmask", 0, hugsprim___hscore_sig_setmask_60},
    {"const_sig_block", 0, hugsprim___hscore_sig_block_59},
    {"const_sigttou", 0, hugsprim___hscore_sigttou_58},
    {"const_vtime", 0, hugsprim___hscore_vtime_57},
    {"const_vmin", 0, hugsprim___hscore_vmin_56},
    {"const_icanon", 0, hugsprim___hscore_icanon_55},
    {"const_tcsanow", 0, hugsprim___hscore_tcsanow_54},
    {"const_echo", 0, hugsprim___hscore_echo_53},
    {"st_mode", 2, hugsprim___hscore_st_mode_52},
    {"st_size", 2, hugsprim___hscore_st_size_51},
    {"st_mtime", 2, hugsprim___hscore_st_mtime_50},
    {"sizeof_stat", 0, hugsprim___hscore_sizeof_stat_49},
    {"s_isfifo", 1, hugsprim___hscore_s_isfifo_48},
    {"s_isdir", 1, hugsprim___hscore_s_isdir_47},
    {"s_isblk", 1, hugsprim___hscore_s_isblk_46},
    {"s_ischr", 1, hugsprim___hscore_s_ischr_45},
    {"s_isreg", 1, hugsprim___hscore_s_isreg_44},
    {"o_BINARY", 0, hugsprim___hscore_o_binary_43},
    {"o_NONBLOCK", 0, hugsprim___hscore_o_nonblock_42},
    {"o_NOCTTY", 0, hugsprim___hscore_o_noctty_41},
    {"o_TRUNC", 0, hugsprim___hscore_o_trunc_40},
    {"o_EXCL", 0, hugsprim___hscore_o_excl_39},
    {"o_CREAT", 0, hugsprim___hscore_o_creat_38},
    {"o_APPEND", 0, hugsprim___hscore_o_append_37},
    {"o_RDWR", 0, hugsprim___hscore_o_rdwr_36},
    {"o_WRONLY", 0, hugsprim___hscore_o_wronly_35},
    {"o_RDONLY", 0, hugsprim___hscore_o_rdonly_34},
    {"d_name", 2, hugsprim___hscore_d_name_33},
    {"end_of_dir", 0, hugsprim___hscore_end_of_dir_32},
    {"freeDirEnt", 2, hugsprim___hscore_free_dirent_31},
    {"readdir", 3, hugsprim___hscore_readdir_30},
    {"c__setmode", 3, hugsprim__setmode_29},
    {"c_getpid", 1, hugsprim_getpid_28},
    {"c_unlink", 2, hugsprim_unlink_27},
    {"c_ftruncate", 3, hugsprim___hscore_ftruncate_26},
    {"c_write", 4, hugsprim_write_25},
    {"c_umask", 2, hugsprim_umask_24},
    {"c_stat", 3, hugsprim___hscore_stat_23},
    {"c_rmdir", 2, hugsprim_rmdir_22},
    {"c_rewinddir", 2, hugsprim_rewinddir_21},
    {"c_rename", 3, hugsprim___hscore_renameFile_20},
    {"c_read", 4, hugsprim_read_19},
    {"mkdir", 3, hugsprim___hscore_mkdir_18},
    {"c_opendir", 2, hugsprim_opendir_17},
    {"c_open", 4, hugsprim___hscore_open_16},
    {"lstat", 3, hugsprim___hscore_lstat_15},
    {"c_lseek", 4, hugsprim___hscore_lseek_14},
    {"c_isatty", 2, hugsprim_isatty_13},
    {"c_getcwd", 3, hugsprim_getcwd_12},
    {"c_fstat", 3, hugsprim___hscore_fstat_11},
    {"c_dup2", 3, hugsprim_dup2_10},
    {"c_dup", 2, hugsprim_dup_9},
    {"c_creat", 3, hugsprim_creat_8},
    {"c_closedir", 2, hugsprim_closedir_7},
    {"c_close", 2, hugsprim_close_6},
    {"c_chdir", 2, hugsprim_chdir_5},
    {"c_chmod", 3, hugsprim_chmod_4},
    {"c_access", 3, hugsprim_access_3},
    {"get_console_echo", 2, hugsprim_get_console_echo___2},
    {"set_console_echo", 3, hugsprim_set_console_echo___1},
    {"set_console_buffering", 3, hugsprim_set_console_buffering___0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initSPInternals
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

