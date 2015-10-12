defmodule Monotonic do
  defmacro __using__(_opts) do
    quote do
      require Monotonic
      import  Monotonic, only: [monotonic_microseconds: 0, monotonic_milliseconds: 0]
    end
  end

  @doc """
  Returns the current OS monotonic time in microseconds.

  This method is imported into any module `use`-ing Monotonic
  so in that case it can be called as simple `monotonic_microseconds`
  """
  defmacro monotonic_microseconds do
    quote do
      :c_monotonic_time.microseconds()
    end
  end

  @doc """
  Returns the current OS monotonic time in microseconds.

  This macro is not imported so should be called as

      Monotonic.microseconds
  """
  defmacro microseconds do
    quote do
      :c_monotonic_time.microseconds()
    end
  end

  @doc """
  Returns the current OS monotonic time in milliseconds.

  This method is imported into any module `use`-ing Monotonic
  so in that case it can be called as simple `monotonic_milliseconds`
  """
  defmacro monotonic_milliseconds do
    quote do
      :c_monotonic_time.milliseconds()
    end
  end

  @doc """
  Returns the current OS monotonic time in milliseconds.

  This macro is not imported so should be called as

      Monotonic.milliseconds
  """
  defmacro milliseconds do
    quote do
      :c_monotonic_time.milliseconds()
    end
  end
end
