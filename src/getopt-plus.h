#ifndef _GETOPT_PLUS_H
#define _GETOPT_PLUS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

typedef enum option_argument_t {
  NO_ARGUMENT,
  OPTIONAL_ARGUMENT,
  REQUIRED_ARGUMENT
} option_argument_t;

typedef struct option_t {
  char* long_option;
  option_argument_t argument_requiement;
  uint_fast8_t flag_ptr, value;  //TODO: Union type?
} option_t;

int_fast8_t getopt_plus(int argc, char** argv, char* short_options, option_t[] long_options);

#ifdef __cplusplus
}
#endif

#endif
