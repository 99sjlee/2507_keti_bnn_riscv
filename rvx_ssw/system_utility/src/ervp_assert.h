#ifndef __ERVP_ASSERT_H__
#define __ERVP_ASSERT_H__

#include "ervp_platform_api.h"
#include "ervp_printf.h"

#ifdef NDEBUG
  #define assert(ignore) ((void)0)
  #define assert_msg(...) ((void)0)
#else
  #define assert(expr) assert_must(expr)
  #define assert_msg(expr, ...) {if(!(expr)) { printf_must("\n"); printf_must(__VA_ARGS__); assert_must(0);}}
#endif

#define assert_must(expr) assert_must_with_info(expr, #expr, __FILE__, __LINE__, __func__)
#define assert_must_with_info(expr, msg, file, line, func) {if(!(((unsigned int)(expr)))) assert_fail_rvx(msg, file, line, func);}

void assert_fail_rvx(const char* expr, const char* file, unsigned int line, const char* func);

#define POINTEROR1(a1)                        ((int)a1)
#define POINTEROR2(a1, a2)                    (((int)a1) | ((int)a2))
#define POINTEROR3(a1, a2, a3)                (((int)a1) | ((int)a2) | ((int)a3))
#define POINTEROR4(a1, a2, a3, a4)            (((int)a1) | ((int)a2) | ((int)a3) | ((int)a4))
#define POINTEROR5(a1, a2, a3, a4, a5)        (((int)a1) | ((int)a2) | ((int)a3) | ((int)a4) | ((int)a5))

#define assert_pointer(n, ...) assert(POINTEROR##n(__VA_ARGS__))
#define assert_pointer_align(p, n) assert((((unsigned int)(p))&(n-1))==0)

int check_if_data_porinter_is_valid(void* p);

#define assert_invalid_data_pointer(p) assert_msg(check_if_data_porinter_is_valid(p), "invalid data pointer")

#define assert_not_implemented() { printf_must("\n"); printf_must("Not Implemented"); assert_must(0);}

#endif
