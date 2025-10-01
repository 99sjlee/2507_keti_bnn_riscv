#ifndef __NPX_PROFILING_H__
#define __NPX_PROFILING_H__

#include "platform_info.h"
#include "ervp_profiling.h"

#define NPX_PROFILING_START() \
  static profile_t *section = NULL; \
  {if (section == NULL) section = profiling_register(__func__);} \
  profiling_start_by_section(section)

#define NPX_PROFILING_END() profiling_end_by_section(section)

#endif
