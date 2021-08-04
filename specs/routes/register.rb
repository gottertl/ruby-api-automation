require "httparty"

class Register
    include HTTParty
    base_uri "https://reqres.in/api"

    def create(email, password)
        payload = { email: email, password: password }

        return self.class.post(
            "/register",
            body: payload.to_json(),
            headers: {
                "Content-Type": "application/json"
            }
        )
    end
end