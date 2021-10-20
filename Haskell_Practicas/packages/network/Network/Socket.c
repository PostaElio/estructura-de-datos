/* Machine generated file, do not modify */
#include <stdlib.h>
#include "HsFFI.h"
#include "HsNet.h"

static HugsAPI5 *hugs = 0;

#ifndef ENABLE_MACRO_INTERFACE
#undef getWSErrorDescr
#endif

static void hugsprim_getWSErrorDescr_26(HugsStackPtr);
static void hugsprim_getWSErrorDescr_26(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr res1;
    arg1 = hugs->getInt32();
    res1 = getWSErrorDescr(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef WSAGetLastError
#endif

static void hugsprim_WSAGetLastError_25(HugsStackPtr);
static void hugsprim_WSAGetLastError_25(HugsStackPtr hugs_root)
{
    HsInt32 res1;
    res1 = WSAGetLastError();
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef setsockopt
#endif

static void hugsprim_setsockopt_24(HugsStackPtr);
static void hugsprim_setsockopt_24(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    HsInt32 arg5;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getInt32();
    res1 = setsockopt(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getsockopt
#endif

static void hugsprim_getsockopt_23(HugsStackPtr);
static void hugsprim_getsockopt_23(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsPtr arg4;
    HsPtr arg5;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    arg4 = hugs->getPtr();
    arg5 = hugs->getPtr();
    res1 = getsockopt(arg1, arg2, arg3, arg4, arg5);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getsockname
#endif

static void hugsprim_getsockname_22(HugsStackPtr);
static void hugsprim_getsockname_22(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = getsockname(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef getpeername
#endif

static void hugsprim_getpeername_21(HugsStackPtr);
static void hugsprim_getpeername_21(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = getpeername(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef recvfrom
#endif

static void hugsprim_recvfrom_20(HugsStackPtr);
static void hugsprim_recvfrom_20(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsPtr arg6;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getPtr();
    res1 = recvfrom(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef recv
#endif

static void hugsprim_recv_19(HugsStackPtr);
static void hugsprim_recv_19(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    res1 = recv(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef sendto
#endif

static void hugsprim_sendto_18(HugsStackPtr);
static void hugsprim_sendto_18(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsPtr arg5;
    HsInt32 arg6;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    arg5 = hugs->getPtr();
    arg6 = hugs->getInt32();
    res1 = sendto(arg1, arg2, arg3, arg4, arg5, arg6);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef send
#endif

static void hugsprim_send_17(HugsStackPtr);
static void hugsprim_send_17(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsWord32 arg3;
    HsInt32 arg4;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getWord32();
    arg4 = hugs->getInt32();
    res1 = send(arg1, arg2, arg3, arg4);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef rtsSupportsBoundThreads
#endif

static void hugsprim_rtsSupportsBoundThreads_16(HugsStackPtr);
static void hugsprim_rtsSupportsBoundThreads_16(HugsStackPtr hugs_root)
{
    HsBool res1;
    res1 = rtsSupportsBoundThreads();
    hugs->putBool(res1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef listen
#endif

static void hugsprim_listen_15(HugsStackPtr);
static void hugsprim_listen_15(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = listen(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef accept
#endif

static void hugsprim_accept_14(HugsStackPtr);
static void hugsprim_accept_14(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = accept(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef accept
#endif

static void hugsprim_accept_13(HugsStackPtr);
static void hugsprim_accept_13(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsPtr arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getPtr();
    res1 = accept(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef connect
#endif

static void hugsprim_connect_12(HugsStackPtr);
static void hugsprim_connect_12(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    res1 = connect(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef bind
#endif

static void hugsprim_bind_11(HugsStackPtr);
static void hugsprim_bind_11(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsPtr arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getPtr();
    arg3 = hugs->getInt32();
    res1 = bind(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef socket
#endif

static void hugsprim_socket_10(HugsStackPtr);
static void hugsprim_socket_10(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 arg3;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    arg3 = hugs->getInt32();
    res1 = socket(arg1, arg2, arg3);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef closesocket
#endif

static void hugsprim_closesocket_9(HugsStackPtr);
static void hugsprim_closesocket_9(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    res1 = closesocket(arg1);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef shutdown
#endif

static void hugsprim_shutdown_8(HugsStackPtr);
static void hugsprim_shutdown_8(HugsStackPtr hugs_root)
{
    HsInt32 arg1;
    HsInt32 arg2;
    HsInt32 res1;
    arg1 = hugs->getInt32();
    arg2 = hugs->getInt32();
    res1 = shutdown(arg1, arg2);
    hugs->putInt32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef inet_addr
#endif

static void hugsprim_inet_addr_7(HugsStackPtr);
static void hugsprim_inet_addr_7(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsWord32 res1;
    arg1 = hugs->getPtr();
    res1 = inet_addr(arg1);
    hugs->putWord32(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef my_inet_ntoa
#endif

static void hugsprim_my_inet_ntoa_6(HugsStackPtr);
static void hugsprim_my_inet_ntoa_6(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsPtr res1;
    arg1 = hugs->getWord32();
    res1 = my_inet_ntoa(arg1);
    hugs->putPtr(res1);
    hugs->returnIO(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef shutdownWinSock
#endif

static void hugsprim_shutdownWinSock_5(HugsStackPtr);
static void hugsprim_shutdownWinSock_5(HugsStackPtr hugs_root)
{
    shutdownWinSock();
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef initWinSock
#endif

static void hugsprim_initWinSock_4(HugsStackPtr);
static void hugsprim_initWinSock_4(HugsStackPtr hugs_root)
{
    HsInt res1;
    res1 = initWinSock();
    hugs->putInt(res1);
    hugs->returnIO(hugs_root,1);
}
#include "string.h"

#ifndef ENABLE_MACRO_INTERFACE
#undef memset
#endif

static void hugsprim_memset_3(HugsStackPtr);
static void hugsprim_memset_3(HugsStackPtr hugs_root)
{
    HsPtr arg1;
    HsInt32 arg2;
    HsWord32 arg3;
    arg1 = hugs->getPtr();
    arg2 = hugs->getInt32();
    arg3 = hugs->getWord32();
    memset(arg1, arg2, arg3);
    
    hugs->returnIO(hugs_root,0);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef htonl
#endif

static void hugsprim_htonl_2(HugsStackPtr);
static void hugsprim_htonl_2(HugsStackPtr hugs_root)
{
    HsWord32 arg1;
    HsWord32 res1;
    arg1 = hugs->getWord32();
    res1 = htonl(arg1);
    hugs->putWord32(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef htons
#endif

static void hugsprim_htons_1(HugsStackPtr);
static void hugsprim_htons_1(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsWord16 res1;
    arg1 = hugs->getWord16();
    res1 = htons(arg1);
    hugs->putWord16(res1);
    hugs->returnId(hugs_root,1);
}

#ifndef ENABLE_MACRO_INTERFACE
#undef ntohs
#endif

static void hugsprim_ntohs_0(HugsStackPtr);
static void hugsprim_ntohs_0(HugsStackPtr hugs_root)
{
    HsWord16 arg1;
    HsWord16 res1;
    arg1 = hugs->getWord16();
    res1 = ntohs(arg1);
    hugs->putWord16(res1);
    hugs->returnId(hugs_root,1);
}

static struct hugs_primitive hugs_primTable[] = {
    {"c_getWSError", 2, hugsprim_getWSErrorDescr_26},
    {"c_getLastError", 1, hugsprim_WSAGetLastError_25},
    {"c_setsockopt", 6, hugsprim_setsockopt_24},
    {"c_getsockopt", 6, hugsprim_getsockopt_23},
    {"c_getsockname", 4, hugsprim_getsockname_22},
    {"c_getpeername", 4, hugsprim_getpeername_21},
    {"c_recvfrom", 7, hugsprim_recvfrom_20},
    {"c_recv", 5, hugsprim_recv_19},
    {"c_sendto", 7, hugsprim_sendto_18},
    {"c_send", 5, hugsprim_send_17},
    {"threaded", 0, hugsprim_rtsSupportsBoundThreads_16},
    {"c_listen", 3, hugsprim_listen_15},
    {"c_accept_safe", 4, hugsprim_accept_14},
    {"c_accept", 4, hugsprim_accept_13},
    {"c_connect", 4, hugsprim_connect_12},
    {"c_bind", 4, hugsprim_bind_11},
    {"c_socket", 4, hugsprim_socket_10},
    {"c_close", 2, hugsprim_closesocket_9},
    {"c_shutdown", 3, hugsprim_shutdown_8},
    {"c_inet_addr", 2, hugsprim_inet_addr_7},
    {"c_inet_ntoa", 2, hugsprim_my_inet_ntoa_6},
    {"shutdownWinSock", 1, hugsprim_shutdownWinSock_5},
    {"initWinSock", 1, hugsprim_initWinSock_4},
    {"memset", 4, hugsprim_memset_3},
    {"htonl", 1, hugsprim_htonl_2},
    {"htons", 1, hugsprim_htons_1},
    {"ntohs", 1, hugsprim_ntohs_0},
};

static void hugs_primControl(int);
static void hugs_primControl(what)
int what; {
}

#ifdef STATIC_LINKAGE
#define initModule initNSocket
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

