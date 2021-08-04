require "httparty"

class Users
    include HTTParty
    base_uri "https://reqres.in/api"

    def create(name, job)
        payload = { name: name, job: job }

        return self.class.post(
            "/users",
            body: payload.to_json(),
            headers: {
                "Content-Type": "application/json"
            }
        )
    end

    def updateInfo(name, job)
        payload = { name: name, job: job }

        return self.class.put(
            "/users",
            body: payload.to_json(),
            headers: {
                "Content-Type": "application/json"
            }
        )
    end

    def deleteUser(id)
        return self.class.delete("/users/#{id}")
    end

    def findAll()
        return self.class.get("/users")
    end

    def find(id)
        return self.class.get("/users/#{id}")
    end
end