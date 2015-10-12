Monotonic
=============

An elixir wrapper around `c_monotonic_time` <https://github.com/magnetised/c_monotonic_time>

Provides a few macros to make access to the OS monotonic time easier.

Usage
-----

    iex(1)> require Monotonic
    iex(2)> Monotonic.microseconds
    1845122787

    iex(3)> defmodule Timing do
    ...(3)>   # require's the Monotonic module to compile the macros
    ...(3)>   # and imports `monotonic_milliseconds` and `monotonic_microseconds`
    ...(3)>   use Monotonic
    ...(3)>
    ...(3)>   def us, do: monotonic_microseconds
    ...(3)>   def ms, do: monotonic_milliseconds
    ...(3)> end








