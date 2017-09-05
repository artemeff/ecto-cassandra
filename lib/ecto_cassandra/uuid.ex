defmodule EctoCassandra.UUID do
  @moduledoc """
  An Ecto type for Cassandra UUIDs strings.
  """

  @behaviour Ecto.Type

  @typedoc """
  A hex-encoded UUID string (36 bytes).
  """
  @type t :: <<_::288>>

  @doc """
  The Ecto type.
  """
  def type, do: :uuid

  @doc """
  Casts to UUID.
  """
  @spec cast(t | any) :: {:ok, t} | :error
  def cast(value), do: Ecto.UUID.cast(value)

  @doc """
  Same as `cast/1` but raises `Ecto.CastError` on invalid arguments.
  """
  @spec cast!(t | any) :: t | no_return
  def cast!(value) do
    case cast(value) do
      {:ok, uuid} -> uuid
      :error -> raise Ecto.CastError, type: __MODULE__, value: value
    end
  end

  @doc """
  Converts a string representing a UUID into a binary.
  """
  @spec dump(t | any) :: {:ok, t} | :error
  def dump(value), do: cast(value)

  @doc """
  Converts a binary UUID into a string.
  """
  @spec load(t | any) :: {:ok, t} | :error
  def load(value), do: cast(value)

  @doc """
  Generates a version 4 (random) UUID.
  """
  @spec generate :: t
  def generate, do: Ecto.UUID.generate()

  # Callback invoked by autogenerate fields.
  @doc false
  def autogenerate, do: generate()
end
