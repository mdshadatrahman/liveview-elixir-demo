defmodule LiveviewDemoWeb.LinkLive.New do
  use LiveviewDemoWeb, :live_view

  alias LiveviewDemo.Links

  def mount(_params, _session, socket) do
    changeset = Links.Link.changeset(%Links.Link{})

    socket =
      socket
      |> assign(:form, to_form(changeset))

    {:ok, socket}
  end

  def handle_event("submit", %{"link" => link_params}, socket) do
    params =
      link_params
      |> Map.put("user_id", socket.assigns.current_user.id)

    case Links.create_link(params) do
      {:ok, _link} ->
        socket =
          socket
          |> put_flash(:info, "Link created successfully")
          |> push_navigate(to: ~p"/links")

        {:noreply, socket}

      {:error, changeset} ->
        IO.inspect(changeset)

        socket =
          socket
          |> put_flash(:error, "Something went wrong")
          |> assign(:form, to_form(changeset))

        {:noreply, socket}
    end
  end
end
