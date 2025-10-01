#ifndef __ERVP_MALLOC_H__
#define __ERVP_MALLOC_H__

#include <stddef.h>

#ifdef ASSERT_WHEN_MALLOC_FAILS
#define malloc(x) malloc_rvx_with_assert(x, __FILE__, __LINE__, __func__)
#else
#define malloc malloc_rvx
#endif

void* malloc_rvx(size_t size);
void* malloc_rvx_with_assert(size_t size, const char* file, unsigned int line, const char* func);

#define calloc calloc_rvx
void* calloc_rvx(size_t elt_count, size_t elt_size);

#define free free_rvx
void free_rvx(void* ptr);

#define realloc realloc_rvx
void* realloc_rvx(void *ptr, size_t new_size);

void* malloc_permanent(size_t size, size_t align_size);

static inline void* malloc_option(size_t size, size_t align_size, int is_permanent)
{
  void* ptr;
  if(is_permanent)
    ptr = malloc_permanent(size, align_size);
  else
    ptr = malloc_rvx(size);
  return ptr;
};

void print_heap_status();

#endif
