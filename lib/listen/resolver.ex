defmodule Listen.Resolver do

  alias Listen.Repo
  import Ecto.Query
  alias Listen.Music.Track

  def get_tracks(_, _, _) do
    query = from t in Track,
      limit: 50,
      order_by: [desc: :inserted_at]

    {:ok, Repo.all(query)}
  end
end
