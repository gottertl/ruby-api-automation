require_relative "../routes/register"

describe "POST /register" do
    context "criar conta com sucesso" do
        before() do
            @result = Register.new.create("eve.holt@reqres.in", "pistol")
        end

        it "should return status code 200" do
            expect(@result.code).to eql 200
        end

        it "should return an id" do
            expect(@result.parsed_response["id"]).to be > 0
        end

        it "should return a token" do
            expect(@result.parsed_response["token"].length).to eql 17
        end
    end

    context "senha nao informada" do
        before() do
            @result = Register.new.create("eve.holt@reqres.in", "")
        end

        it "should return status code 400" do
            expect(@result.code).to eql 400
        end

        it "should return an error message" do
            @error = "Missing password"
            expect(@result.parsed_response["error"]).to eql @error
        end
    end
end