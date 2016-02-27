ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Listen.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Listen.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Listen.Repo)

