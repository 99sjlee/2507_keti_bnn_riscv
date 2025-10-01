#ifndef __ERVP_TASK_H__
#define __ERVP_TASK_H__

#include <stddef.h>

typedef int (*ervp_task_wait_fx_t)();
static inline void task_wait_finish(ervp_task_wait_fx_t task_wait_fx)
{
  // debug_printx(task_wait_fx);
  if (task_wait_fx != NULL)
    task_wait_fx();
}

#endif