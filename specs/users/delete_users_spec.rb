require_relative "../routes/users"

describe "DELETE /users" do
    context "delete a user" do
        before() do
            @result = Users.new.deleteUser(2)
        end

        it "should return status code 204" do
            expect(@result.code).to eql 204
        end
    end

    
end