#ifndef BATTERY_READER_TYPES_H
#define BATTERY_READER_TYPES_H

#include <stdint.h>

#ifdef _WIN32
#define WINAPI __stdcall
#else
#define WINAPI
#endif

#ifdef FALSE
#undef FALSE
#endif
#define FALSE 0

#ifdef TRUE
#undef TRUE
#endif
#define TRUE 1

typedef uint32_t DWORD;
typedef unsigned short WORD;
typedef unsigned char BYTE;
typedef int BOOL;
typedef int INT;
typedef unsigned short UINT16;
typedef signed short INT16;

#endif // BATTERY_READER_TYPES_H
