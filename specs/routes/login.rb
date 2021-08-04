require "httparty"

class Login
    include HTTParty
    base_uri "https://reqres.in/api"

    def login(email, password)
        payload = { email: email, password: password }

        return self.class.post(
            "/login",
            body: payload.to_json(),
            headers: {
                "Content-Type": "application/json"
            }
        )
    end
end