defmodule InnovitiesWeb.LandingController do
  use InnovitiesWeb, :controller

  alias Innovities.Repo
  alias Innovities.Accounts
  alias Innovities.Accounts.Innovator
  alias Innovities.Content
  alias Innovities.Content.Idea
  alias Innovities.Tarrifs.InnovatorsPlan

  def promotion_registration(conn, %{"full_name" => _full_name, "email" => _email, "prefered_organization"
    => _prefered_organization, "short_description" => short_description} = params) do

    premium_plan = Repo.get_by!(InnovatorsPlan, name: "Premium")

    new_innovator =
      params
      |> Map.put("password", "sec#re7t1K")
      |> Map.put("innovators_plan_id", premium_plan.id)
      |> Map.delete("short_description")

    case Accounts.create_innovator(new_innovator) do
      {:ok, inno = %Innovator{}} ->
        if (String.length(short_description) == 0) do
          render(conn, "promo_registration.json", innovator: inno, idea: %Idea{innovator_id: inno.id, short_description: ""}, error: "")
        else
          new_idea =
            %{}
            |> Map.put(:innovator_id, inno.id)
            |> Map.put(:short_description, short_description)

          case Content.create_idea(new_idea) do
            {:ok, i = %Idea{}} ->
              render(conn, "promo_registration.json", innovator: inno, idea: i, error: "")
            {:error, _} ->
              render(conn, "promo_registration.json", innovator: inno, idea: %Idea{innovator_id: inno.id, short_description: ""}, error: "Չկարողացա գրանցել Ձեր գաղափարը: Կապվեք մեզ հետ, խնդրում եմ")
          end

        end
      {:error, _} ->
        render(conn, "promo_registration.json", innovator: %Innovator{full_name: "", email: "", prefered_organization: ""}, idea: %Idea{innovator_id: 0, short_description: ""}, error: "Չկարողացա գրանցել Ձեր տվյալները: Կապվեք մեզ հետ, խնդրում եմ")
    end
  end

end
