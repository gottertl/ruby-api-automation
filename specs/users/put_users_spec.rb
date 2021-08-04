require_relative "../routes/users"

describe "PUT /users" do
    context "create user" do
        before() do
            @result = Users.new.updateInfo("Morpheus", "Enlightened One")
        end

        it "should return status code 200" do
            expect(@result.code).to eql 200
        end

        it "should return the updated date" do
            expect(@result.parsed_response["updatedAt"]).to be_truthy
        end
    end

    
end