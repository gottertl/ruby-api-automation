require_relative "../routes/users"

describe "POST /users" do
    context "create user" do
        before() do
            @result = Users.new.create("Neo", "Leader")
        end

        it "should return status code 201" do
            expect(@result.code).to eql 201
        end

        it "should return an id" do
            expect(@result.parsed_response["id"]).to be_truthy
        end

        it "should return the created date" do
            expect(@result.parsed_response["createdAt"]).to be_truthy
        end
    end

    
end