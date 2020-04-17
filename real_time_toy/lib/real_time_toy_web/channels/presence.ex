defmodule RealTimeToyWeb.Presence do
	use Phoenix.Presence, otp_app: :real_time_toy,
		pubsub_server: RealTimeToy.PubSub
end
