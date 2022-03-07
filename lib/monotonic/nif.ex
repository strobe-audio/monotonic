defmodule Monotonic.NIF do
  @on_load {:load_nifs, 0}

  def load_nifs do
    path = :filename.join(:code.priv_dir(:monotonic), 'monotonic_nif')

    :erlang.load_nif(path, 0)
  end

  def milliseconds do
    :erlang.nif_error("NIF library not loaded")
  end

  def microseconds do
    :erlang.nif_error("NIF library not loaded")
  end
end
