# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Project.Repo.insert!(%Project.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Project.Organization.{Status, Area, Expertise}
alias Project.Repo

Repo.insert_all(
  Status,
  [
    %{name: "To Do", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
    %{name: "Working", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
    %{name: "Finished", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)}
  ],
  on_conflict: :nothing
)

Repo.insert_all(
  Area,
  [
    %{name: "Front End", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
    %{name: "Back End", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
    %{name: "UX", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)}
  ],
  on_conflicts: :nothing
);

Repo.insert_all(
  Expertise,
  [
    %{name: "Front End", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
    %{name: "Back End", inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second), updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)},
  ],
  on_conflicts: :nothing
);
