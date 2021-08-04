require_relative "../routes/users"

describe "GET /users" do
    context "find all users" do
        before() do
            @result = Users.new.findAll()
        end

        it "should return status code 200" do
            expect(@result.code).to eql 200
        end

        it "should return a list of users" do
            expect(@result.parsed_response).not_to be_empty
        end
    end

    context "find one user" do
        before() do
            @result = Users.new.find(2)
        end

        it "should return status code 200" do
            expect(@result.code).to eql 200
        end

        it "should return user id" do
            expect(@result.parsed_response["data"]["id"]).to be_truthy
        end
    end

    context "user not found" do
        before() do
            @result = Users.new.find(52)
        end

        it "should return status code 404" do
            expect(@result.code).to eql 404
        end

        it "should return an empty list" do
            expect(@result.parsed_response).to be_empty
        end
    end
    
end