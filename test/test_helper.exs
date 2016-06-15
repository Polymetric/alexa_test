ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AlexaTest.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AlexaTest.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(AlexaTest.Repo)

