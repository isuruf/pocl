#include "sleef_cl.h"

_CL_OVERLOADABLE
float
_cl_sqrt (float x)
{
  return Sleef_sqrtf_u05 (x);
}

_CL_OVERLOADABLE
float2
_cl_sqrt (float2 x)
{

  float lo = _cl_sqrt (x.lo);
  float hi = _cl_sqrt (x.hi);
  return (float2) (lo, hi);
}

_CL_OVERLOADABLE
float4 _cl_sqrt (float4);

_CL_OVERLOADABLE
float3
_cl_sqrt (float3 x)
{

  float4 x_3to4 = (float4) (x, (float)0);

  float4 r = _cl_sqrt (x_3to4);
  return r.xyz;
}

_CL_OVERLOADABLE
float4
_cl_sqrt (float4 x)
{

#if defined(SLEEF_VEC_128_AVAILABLE)
  return Sleef_sqrtf4_u05 (x);
#else

  float2 lo = _cl_sqrt (x.lo);
  float2 hi = _cl_sqrt (x.hi);
  return (float4) (lo, hi);

#endif
}

_CL_OVERLOADABLE
float8
_cl_sqrt (float8 x)
{

#if defined(SLEEF_VEC_256_AVAILABLE)
  return Sleef_sqrtf8_u05 (x);
#else

  float4 lo = _cl_sqrt (x.lo);
  float4 hi = _cl_sqrt (x.hi);
  return (float8) (lo, hi);

#endif
}

_CL_OVERLOADABLE
float16
_cl_sqrt (float16 x)
{

#if defined(SLEEF_VEC_512_AVAILABLE)
  return Sleef_sqrtf16_u05 (x);
#else

  float8 lo = _cl_sqrt (x.lo);
  float8 hi = _cl_sqrt (x.hi);
  return (float16) (lo, hi);

#endif
}

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double
_cl_sqrt (double x)
{
  return Sleef_sqrt_u05 (x);
}

#endif /* cl_khr_fp64 */

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double2
_cl_sqrt (double2 x)
{

#if defined(SLEEF_VEC_128_AVAILABLE) && defined(SLEEF_DOUBLE_VEC_AVAILABLE)
  return Sleef_sqrtd2_u05 (x);
#else

  double lo = _cl_sqrt (x.lo);
  double hi = _cl_sqrt (x.hi);
  return (double2) (lo, hi);

#endif
}

#endif /* cl_khr_fp64 */

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double4 _cl_sqrt (double4);

_CL_OVERLOADABLE
double3
_cl_sqrt (double3 x)
{

  double4 x_3to4 = (double4) (x, (double)0);

  double4 r = _cl_sqrt (x_3to4);
  return r.xyz;
}

#endif /* cl_khr_fp64 */

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double4
_cl_sqrt (double4 x)
{

#if defined(SLEEF_VEC_256_AVAILABLE) && defined(SLEEF_DOUBLE_VEC_AVAILABLE)
  return Sleef_sqrtd4_u05 (x);
#else

  double2 lo = _cl_sqrt (x.lo);
  double2 hi = _cl_sqrt (x.hi);
  return (double4) (lo, hi);

#endif
}

#endif /* cl_khr_fp64 */

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double8
_cl_sqrt (double8 x)
{

#if defined(SLEEF_VEC_512_AVAILABLE) && defined(SLEEF_DOUBLE_VEC_AVAILABLE)
  return Sleef_sqrtd8_u05 (x);
#else

  double4 lo = _cl_sqrt (x.lo);
  double4 hi = _cl_sqrt (x.hi);
  return (double8) (lo, hi);

#endif
}

#endif /* cl_khr_fp64 */

#ifdef cl_khr_fp64

_CL_OVERLOADABLE
double16
_cl_sqrt (double16 x)
{

  double8 lo = _cl_sqrt (x.lo);
  double8 hi = _cl_sqrt (x.hi);
  return (double16) (lo, hi);
}

#endif /* cl_khr_fp64 */
